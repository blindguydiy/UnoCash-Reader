import 'dart:io';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image/image.dart' as img;
import '../../main.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import '../../about.dart';

class CameraView extends StatefulWidget {
  CameraView(
      {Key? key,
      required this.title,
      required this.outputText,
      //required this.isZero,
      required this.onImage,
      this.initialDirection = CameraLensDirection.back})
      : super(key: key);

  final String title;
  final List? outputText;
  //bool isZero;
  final Function(InputImage inputImage) onImage;
  final CameraLensDirection initialDirection;

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {

  CameraController? _controller;
  File? _image;
  int _cameraIndex = 0;
  bool isPlaying = false;
  late FlutterTts _flutterTts;
  //CameraImage? _savedImage;

  @override
  void initState() {
    super.initState();
    initializeTts();

    for (var i = 0; i < cameras.length; i++) {
      if (cameras[i].lensDirection == widget.initialDirection) {
        _cameraIndex = i;
      }
    }
    _startLiveFeed();

  }

  @override
  void dispose() {
    _stopLiveFeed();
    _flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Text('About'),
            tooltip: 'About Uno Cash reader and licenses',
            onPressed: () { 
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => about()),
              );  // Navigator.push 
            },
          ),
],
      ),
      body: 
        _controller?.value.isInitialized == false ?
          Container()
        :     Container(
          color: Colors.black,
          child: Column(
            children: <Widget>[

              CameraPreview(_controller!),

              Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FloatingActionButton.extended(
                    tooltip: 'Turn flash on',
                    label: Text('FLASH ON'),
                    heroTag: 'flashOn',
                    onPressed: () {
                      _controller?.setFlashMode(FlashMode.torch);
                    }, // onPress
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ), // floating action button extended
                  FloatingActionButton.extended(
                    tooltip: 'Turn flash off',
                    label: Text('FLASH OFF'),
                    heroTag: 'flashOff',
                    onPressed: () {
                      _controller?.setFlashMode(FlashMode.off);
                    }, // onPress
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ), // floating action button extended
                ] // row
              ), //row
            ), //container
          ], // stack
        ), // column
      ), // container
    ); // return
  } // widget build

  Future _startLiveFeed() async {
    final camera = cameras[_cameraIndex];
    _controller = CameraController(
      camera,
      ResolutionPreset.low,
      enableAudio: false,
    );
    _controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      _controller?.startImageStream(_processCameraImage);
    _controller?.setFlashMode(FlashMode.torch);
      setState(() {});
    });

  }

  Future _stopLiveFeed() async {
    await _controller?.stopImageStream();
    await _controller?.dispose();
    _controller = null;
  }

  Future _processCameraImage(CameraImage image) async {
    //_savedImage = image;

    final WriteBuffer allBytes = WriteBuffer();
    for (Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }


    final bytes = allBytes.done().buffer.asUint8List();


    final Size imageSize =
        Size(image.width.toDouble(), image.height.toDouble());

    final camera = cameras[_cameraIndex];
    final imageRotation =
        InputImageRotationMethods.fromRawValue(camera.sensorOrientation) ??
            InputImageRotation.Rotation_0deg;

    final inputImageFormat =
        InputImageFormatMethods.fromRawValue(image.format.raw) ??
            InputImageFormat.NV21;

    final planeData = image.planes.map(
      (Plane plane) {
        return InputImagePlaneMetadata(
          bytesPerRow: plane.bytesPerRow,
          height: plane.height,
          width: plane.width,
        );
      },
    ).toList();

    final inputImageData = InputImageData(
      size: imageSize,
      imageRotation: imageRotation,
      inputImageFormat: inputImageFormat,
      planeData: planeData,
    );

    final inputImage =
        InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);

    widget.onImage(inputImage);
    List? speakText = [];
    speakText = widget.outputText;
    if (speakText!.isNotEmpty) {
      await _speak('${widget.outputText}');
    } else {
      _speak('');
    }


  }

  initializeTts() {
    _flutterTts = FlutterTts();



    _flutterTts.setStartHandler(() {
      setState(() {
        isPlaying = true;
      });
    });

    _flutterTts.setCompletionHandler(() {
      setState(() {
        isPlaying = false;
      });
    });

    _flutterTts.setErrorHandler((err) {
      setState(() {
        print("error occurred: " + err);
        isPlaying = false;
      });
    });
  }


  Future _speak(String text) async {
//FlutterTts? flutterTts;
await _flutterTts.awaitSpeakCompletion(true);

    if (text != null && text.isNotEmpty) {
      var result = await _flutterTts.speak(text);
      if (result == 1)
        setState(() {
          isPlaying = true;
        });
    }
  }

  Future _stop() async {
    var result = await _flutterTts.stop();
    if (result == 1)
      setState(() {
        isPlaying = false;
      });
  }

  void setTtsLanguage() async {
    await _flutterTts.setLanguage("en-US");
  }



}
