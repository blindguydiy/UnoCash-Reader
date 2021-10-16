// import camera view
import 'camera_live_view/camera_view.dart';

//import packages
import 'package:flutter/foundation.dart';

import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image/image.dart' as img;
 import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';


class CashDigits extends StatefulWidget {

  @override
  _CashDigitsState createState() => _CashDigitsState();
}

class _CashDigitsState extends State<CashDigits> {

  TextDetector textDetector = GoogleMlKit.vision.textDetector();
  bool isBusy = false;
  //bool isZero = false;
  List? outputText = [];
  //File? processedImage;
  //img.Image? saveImage;

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() async {
    super.dispose();
    await textDetector.close();
  }

  @override
  Widget build(BuildContext context) {
    return CameraView(
      title: 'Uno Cash Reader',

      onImage: (inputImage) {

        processImage(inputImage);
      },
      outputText: outputText,
//isZero: isZero,
    );
  }

  Future<void> processImage(var inputImage) async {
    if (isBusy) return;
    isBusy = true;
    final recognisedText = await textDetector.processImage(inputImage!);


    //retrieve the text from the RecognisedText object and then separate out the 4 digits from it. The text is present in blocks -> lines -> text.
    // Regular expression for verifying an int number
    String pattern = r"^\b(\d{1,4})\b$";
    RegExp regEx = RegExp(pattern);

    List? grabText = [];

    // Finding and storing the text String(s)
    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        if (regEx.hasMatch(line.text )) {
          if (line.text == '10') { 
            grabText.add(line.text);
          } else           if (line.text == '20') { 
            grabText.add(line.text);
          } else           if (line.text == '30') { 
            grabText.add(line.text);
          } else           if (line.text == '50') { 
            grabText.add(line.text);
          } else           if (line.text == '100') { 
            grabText.add(line.text);
          } else           if (line.text == '200') { 
            grabText.add(line.text);
          } else           if (line.text == '500') { 
            grabText.add(line.text);
                    } else           if (line.text == '1000') { 
            grabText.add(line.text);
          } else           if (line.text == '2000') { 
            grabText.add(line.text);
          } else           if (line.text == '5000') { 
            grabText.add(line.text);
          } else           if (line.text == '7000') { 
            grabText.add(line.text);
}          
        if (line.text.startsWith('0')) {
          grabText.add("Rotate");
  
        }

        }
      }
    }

    isBusy = false;
    if (mounted) {
      setState(() {});
      outputText = grabText;
    }
  }

}
