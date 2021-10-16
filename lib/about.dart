/*
MIT License

Copyright (c) 2021 Hendrik Lubbe

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

// import packages
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'mitLicense.dart';
import 'privacyPolicy.dart';
class about extends StatefulWidget {

  @override
  _aboutState createState() => _aboutState();

}

class _aboutState extends State<about> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("About Uno Cash Reader"),

        actions: [
          IconButton(
            icon: Text('Software License'),
            tooltip: 'Software license for Uno Text Reader',
            onPressed: () { 
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>                             appLicense()),
              );  // Navigator.push 
            },
          ),
          IconButton(
            icon: Text('Applicable License'),
            tooltip: 'Applicable licenses for Uno Barcode Reader',
            onPressed: () { 
              showLicensePage(context: context);
            },
          ),

          IconButton(
            icon: Text('Privacy Policy'),
            tooltip: 'Privacy Policy for Uno Text Reader',
            onPressed: () { 
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>                             privacyPolicy()),
              );  // Navigator.push 
            },
          ),

        ],
      ), // appBar
      body: DefaultTextStyle(
        child: Container(
          color: Colors.black,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Semantics(
                  header: true,
                  child: Text("UNO CASH READER\n", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                ), // Semantics
                Text("""This app was developed with  blind users in mind.  The name is derived 'Uno', my first and only guide dog that retired. \n"""),
                Text("""I decided to develop this app to make it possible for me to be able to identify banknotes I have.  Not to authenticate the banknote but only to tell me what domination I have so when I go to the shp I know how much money I have in my hand.\n"""),
                Text("""For now it only identify the cash amount when the banknote is uprite and not up-side down.  But next update it will be able to do that.\nThis app do not need any internet connection and is a on device app.\n"""),
                Text("""You are welcome to contact me if you require more information or have any suggestions.\n"""),
                Semantics(
                  header: true,
                  child: Text("""CONTACT DETAILS:""", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))
                ), // Semantics
                Text("""You can double tap on the email to open your email app to send me a email or double tap on the phone number to open your dialing app to call me.\n"""),
                Text("""Developer: Hendrik Lubbe"""),
                GestureDetector(
                  child: Text("""Email:  blindguydiy@gmail.com<mailto:blindguydiy@gmail.com>"""),
                    onTap: () {
                      setState(() {
                        _contactMe(        Uri.encodeFull('mailto:blindguydiy@gmail.com?subject=Uno Barcode Reader Response')); 
                      }); // setstate
                    } // ontap
                ), // gesture detector
                GestureDetector(
                  child: Text("""Contact number:  +27795235842"""),
                    onTap: () {
                      setState(() {
                        _contactMe("tel:+27795235842");
                      }); // setstate
                    } // ontap
                ), // gesture detector
              ], // column widget
            ), // column
          ), // single child scroll
        ),  //  container
        style: TextStyle(color: Colors.white),
      ), // body DefaultTextStyle
    );  // scaffold
  }  // build widget

  void _contactMe(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  void showLicensePage({
    required BuildContext context,
    String? applicationName,
    String? applicationVersion,
    Widget? applicationIcon,
    String? applicationLegalese,
    bool useRootNavigator = false,
  }) {
    assert(context != null);
    assert(useRootNavigator != null);
    Navigator.of(context, rootNavigator: useRootNavigator)
        .push(MaterialPageRoute<void>(
      builder: (BuildContext context) => LicensePage(
        applicationName: applicationName,
        applicationVersion: applicationVersion,
        applicationIcon: applicationIcon,
        applicationLegalese: applicationLegalese,
      ),
    ));
  }
 
}
