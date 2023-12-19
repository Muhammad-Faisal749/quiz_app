import 'package:flutter/material.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({super.key});

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
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
                  Text('Terms of Use',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
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
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'TERMS OF USE\n\n',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                'These terms and conditions (“Agreement”) set forth the general terms and conditions of your use of the “FaFa” mobile application (“Mobile Application” or “Service”) and any of its related products and services (collectively, “Services”). This Agreement is legally binding between you (“User”, “you” or “your”) and this Mobile Application developer (“Operator”, “we”, “us” or “our”). If you are entering into this agreement on behalf of a business or other legal entity, you represent that you have the authority to bind such entity to this agreement, in which case the terms “User”, “you” or “your” shall refer to such entity. If you do not have such authority, or if you do not agree with the terms of this agreement, you must not accept this agreement and may not access and use the Mobile Application and Services. By accessing and using the Mobile Application and Services, you acknowledge that you have read, understood, and agree to be bound by the terms of this Agreement. You acknowledge that this Agreement is a contract between you and the Operator, even though it is electronic and is not physically signed by you, and it governs your use of the Mobile Application and Services.\n\n',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                          TextSpan(
                            text: 'Age requirement\n\n',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                'You must be at least 18 years of age to use the Mobile Application and Services. By using the Mobile Application and Services and by agreeing to this Agreement you warrant and represent that you are at least 18 years of age.\n\n',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                          TextSpan(
                            text: 'Links to other resources\n\n',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                'Although the Mobile Application and Services may link to other resources (such as websites, mobile applications, etc.), we are not, directly or indirectly, implying any approval, association, sponsorship, endorsement, or affiliation with any linked resource, unless specifically stated herein. We are not responsible for examining or evaluating, and we do not warrant the offerings of, any businesses or individuals or the content of their resources. We do not assume any responsibility or liability for the actions, products, services, and content of any other third parties. You should carefully review the legal statements and other conditions of use of any resource which you access through a link in the Mobile Application. Your linking to any other off-site resources is at your own risk.\n\n',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                          TextSpan(
                            text: 'Intellectual property rights\n\n',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                '“Intellectual Property Rights” means all present and future rights conferred by statute, common law or equity in or in relation to any copyright and related rights, trademarks, designs, patents, inventions, goodwill and the right to sue for passing off, rights to inventions, rights to use, and all other intellectual property rights, in each case whether registered or unregistered and including all applications and rights to apply for and be granted, rights to claim priority from, such rights and all similar or equivalent rights or forms of protection and any other results of intellectual activity which subsist or will subsist now or in the future in any part of the world. This Agreement does not transfer to you any intellectual property owned by the Operator or third parties, and all rights, titles, and interests in and to such property will remain (as between the parties) solely with the Operator. All trademarks, service marks, graphics and logos used in connection with the Mobile Application and Services, are trademarks or registered trademarks of the Operator or its licensors. Other trademarks, service marks, graphics and logos used in connection with the Mobile Application and Services may be the trademarks of other third parties. Your use of the Mobile Application and Services grants you no right or license to reproduce or otherwise use any of the Operator or third party trademarks.\n\n',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                          TextSpan(
                            text: 'Changes and amendments\n\n',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                'We reserve the right to modify this Agreement or its terms related to the Mobile Application and Services at any time at our discretion. When we do, we will post a notification in the Mobile Application. We may also provide notice to you in other ways at our discretion, such as through the contact information you have provided.\n\nAn updated version of this Agreement will be effective immediately upon the posting of the revised Agreement unless otherwise specified. Your continued use of the Mobile Application and Services after the effective date of the revised Agreement (or such other act specified at that time) will constitute your consent to those changes.\n\n',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                          TextSpan(
                            text: 'Governing Law\n\n',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                'These legal terms shall be governed by and defined following the laws of Macao. The Mobile Application developer and yourself irrevocably consent that the courts of Macao shall have exclusive jurisdiction to resolve any dispute which may arise in connection with these legal terms.\n\n',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                          TextSpan(
                            text: 'Acceptance of these terms\n\n',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                'You acknowledge that you have read this Agreement and agree to all its terms and conditions. By accessing and using the Mobile Application and Services you agree to be bound by this Agreement. If you do not agree to abide by the terms of this Agreement, you are not authorized to access or use the Mobile Application and Services.\n\n',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                          TextSpan(
                            text: 'Contacting us\n\n',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                'If you have any questions, concerns, or complaints regarding this Agreement, we encourage you to contact us using the details below:\n\nEmail: yucreativeindustries@gmail.com\n\n',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16),
                          ),
                          TextSpan(
                            text:
                                'This document was last updated on June 10, 2023',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontStyle: FontStyle.italic),
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
