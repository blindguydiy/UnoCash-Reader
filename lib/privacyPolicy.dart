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

class privacyPolicy extends StatefulWidget {

  @override
  _privacyPolicyState createState() => _privacyPolicyState();

}

class _privacyPolicyState extends State<privacyPolicy> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Privacy Policy Page"),
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
                  child: Text("Privacy policy for Uno Cash Reader\n", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                ), // Semantics
                Text("""App Owner:  Hendrik Lubbe\nContact Email:  blindguydiy@gmail.com"""),
                Text("""Hendrik Lubbe built the Uno Cash Reader app as a Free app. This SERVICE is provided by Hendrik Lubbe at no cost and is intended for use as is.\nThis page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.\nIf you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy. \nThe terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Uno Cash Reader unless otherwise defined in this Privacy Policy.\n"""),
                Text("""Information Collection and Use\nFor a better experience, while using our Service, I may require you to provide us with certain personally identifiable information, including but not limited to Camera for scanning text. The information that I request will be retained on your device and is not collected by me in any way.\nThe app does use third party services that may collect information used to identify you.\nLink to privacy policy of third party service providers used by the app\n• Google Play Services\nLog Data\nI want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics.\nCookies\nCookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory.\nThis Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.\nService Providers\nI may employ third-party companies and individuals due to the following reasons:\n• To facilitate our Service;\n• To provide the Service on our behalf;\n• To perform Service-related services; or\n• To assist us in analyzing how our Service is used.\nI want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.\n\nSecurity\nI value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.\nLinks to Other Sites\nThis Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.\n\nChildren’s Privacy\nThese Services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13 years of age. In the case I discover that a child under 13 has provided me with personal information, I immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do necessary actions.\nChanges to This Privacy Policy\nI may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page.\nThis policy is effective as of 2021-06-24\nContact Us\nIf you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me at blindguydiy@gmail.com.\n\nThis privacy policy page was created at privacypolicytemplate.net and modified/generated by App Privacy Policy Generator\n"""),
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
 
}
