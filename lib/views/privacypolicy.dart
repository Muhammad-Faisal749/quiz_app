import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(75, 123, 217, 1),
            Color.fromRGBO(175, 127, 235, 1),
          ],
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: height / 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/Group 20.png')),
                  Text('Privacy Policy',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                  // Added a placeholder here to center the title
                  Opacity(
                      opacity: 0, child: Image.asset('assets/Group 20.png')),
                ],
              ),
              SizedBox(height: height / 20),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white54),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Privacy Policy\n\n',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'Last updated: May 20, 2023\n\n',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 18),
                          ),
                          TextSpan(
                            text:
                                'Terms and definitions\nFaFa App, ("FaFa App", "we", "us", "our") is dedicated to protecting the privacy rights of our online users. We understand how important privacy is to you, and we are committed to creating a safe and secure environment for learners of all ages. This privacy policy ("Policy") describes how the personally identifiable information ("Personal Information") you may provide in the applications (“Apps") and any of its related products and services (collectively, "Services") is collected, protected and used.\nPLEASE READ THIS PRIVACY POLICY CAREFULLY. THIS PRIVACY POLICY MAY BE MODIFIED FROM TIME TO TIME.\n\n',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                          TextSpan(
                            text:
                                'We respect and maintain personal privacy and accordingly align this policy with the Personal Data Protection Act, Law No. 8/2005  (“PDPA”) when collecting, holding, processing or using Personal Data in Macau. We follow the below principles with respect to your Personal Data:\n\nWhat information do we collect?\n\nPersonal information of adults\nYou can access and use the mobile applications without telling us who you are or revealing any information by which someone could identify you as a specific, identifiable individual.\n\nChildren\'s Privacy\nOur Service does not address anyone under the age of 18. \n\nApps usage information\nWe collect information about how you use the Apps, such as the features you use, gameplay data and the time spent on the Apps. Such information is associated with an internal generated ID (that is assigned to you for our internal purposes).\n\nHow information is collected?\nThe Apps can use the following 3rd party libraries to collect app usage data (NOT associated with any Personal Information):\n\nMicrosoft App Center SDK that collects app usage information according to its Policy: https://docs.microsoft.com/en-us/appcenter/sdk/data-collected;\nFirebase Analytics Service that collects app usage information according to its Policy: https://firebase.google.com/support/privacy and https://policies.google.com/privacy;\n\nHow we use the information we collect?\nWe use the information we collect to:\nOperate, maintain, enhance, and provide all of the features of our Apps.\nPersonalize your experience while using the Apps, including on various devices you use to access the Apps.\nUnderstand and analyse the usage trends, behaviours, and preferences of our users, to improve the way the Apps work and look, and to develop new features and functionality.\n\nAdvertising\nOur apps do not contain any third party advertising.\n\nLinks Within Apps\nSome apps can have external links such as to our website, social media profiles, or to the App Store to allow you to find out more about our company, our products and services.\n\nAll these links are safeguarded against children.\n\nGeo-Location\nOur apps do not collect information about the location of your mobile device.\n\nData protection right\nUnder the PDPA, you have the following data protection rights:\n\n(1) Confirmation as to whether or not data relating to you are being processed and information as to the purposes of the processing, the categories of data concerned and the recipients or categories of recipients to whom the data are disclosed;\n(2) Communication in an intelligible form of the data undergoing processing and of any available information as to their source;\n(3) Knowledge of the reason involved in any automatic processing of data concerning you;\n(4) The rectification, erasure or blocking of data the processing of which does not comply with the provisions of this Act, in particular because of the incomplete or inaccurate nature of the data;\n(5) Notification to third parties to whom the data have been disclosed of any rectification, erasure or blocking carried out in compliance with (4), in which case the third parties are required to rectify, erase or block the data accordingly, unless this proves impossible, or would involve a manifestly disproportionate effort.\nYou have the right to complain to a Data Protection Authority about our collection and use of your Personal Information. For more information, please contact your local data protection authority: Office for Personal Data Protection of the Macau SAR\n\nChanges and amendments\nWe reserve the right to modify this Policy or its terms relating to the mobile application and services from time to time in our discretion and will notify you of any material changes to the way in which we treat Personal Information. When we do, we will revise the updated date at the bottom of this page. We may also provide notice to you in other ways in our discretion, such as through contact information you have provided. Any updated version of this Policy will be effective immediately upon the posting of the revised Policy unless otherwise specified. Your continued use of the mobile applications and services after the effective date of the revised Policy (or such other act specified at that time) will constitute your consent to those changes. However, we will not, without your consent, use your Personal Information in a manner materially different than what was stated at the time your Personal Information was collected.\n\nAcceptance of this policy\nYou acknowledge that you have read this Policy and agree to all its terms and conditions. By accessing and using the mobile applications and services you agree to be bound by this Policy. If you do not agree to abide by the terms of this Policy, you are not authorized to access or use the mobile application and services.\n\nPractical Steps\n\nIf you have any questions about our apps or privacy policy please contact us at: yucreativeindustries@gmail.com\n\nCopyright © FaFa App 2023',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
