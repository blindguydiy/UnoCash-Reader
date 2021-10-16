//import pages
import 'camera_live_stream/cashDigits.dart';

//import packages
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:async';

// Global variable for storing the list of cameras available
List<CameraDescription> cameras = [];

Future<void> main() async {
  // Fetch the available cameras before initializing the app
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    debugPrint('CameraError: ${e.description}');
  }
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cash Reader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CashDigits(),
    );
  }
}
/*
class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late final CameraController _controller;

@override
void initState() {
  _initializeCamera();
  super.initState();
}

// Initializes camera controller to preview on screen
void _initializeCamera() async {
  final CameraController cameraController = CameraController(
    cameras[0],
    ResolutionPreset.high,
  );
  _controller = cameraController;

  _controller.initialize().then((_) {
    if (!mounted) {
      return;
    }
    setState(() {});
  });
}

@override
void dispose() {
  _controller.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('Flutter MLKit Vision'),
    ),
    body: _controller.value.isInitialized
        ? Stack(
            children: <Widget>[
              CameraPreview(_controller),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.camera),
                    label: Text("Click"),
                    onPressed: () async {
                      // If the returned path is not null, navigate
                      // to the DetailScreen
                      await _takePicture().then((String? path) {
                        if (path != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                imagePath: path,
                              ),
                            ),
                          );
                        } else {
                          print('Image path not found!');
                        }
                      });
                    },
                  ),
                ),
              )
            ],
          )
        : Container(
            color: Colors.black,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }

Future<String?> _takePicture() async {
  if (!_controller.value.isInitialized) {
    print("Controller is not initialized");
    return null;
  }

  String? imagePath;

  if (_controller.value.isTakingPicture) {
    print("Processing is in progress...");
    return null;
  }

  try {
    // Turning off the camera flash
    _controller.setFlashMode(FlashMode.off);
    // Returns the image in cross-platform file abstraction
    final XFile file = await _controller.takePicture();
    // Retrieving the path
    imagePath = file.path;
  } on CameraException catch (e) {
    print("Camera Exception: $e");
    return null;
  }

  return imagePath;
}

}
*/