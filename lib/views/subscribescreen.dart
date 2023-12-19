import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay/pay.dart';
import 'package:quiz_app/views/settings.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' show Platform;

import '../languages/LangS.dart';
import '../languages/LangT.dart';
import 'howtoplay.dart';

class SubscribeScreen extends StatefulWidget {
  const SubscribeScreen({super.key});

  @override
  State<SubscribeScreen> createState() => _SubscribeScreenState();
}

class _SubscribeScreenState extends State<SubscribeScreen> {
  String? selectedLanguage;

  getLanguage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      selectedLanguage = pref.getString('language');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getLanguage();
    super.initState();
  }

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: height / 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => HowToPlay())));
                      },
                      child: Image.asset('assets/Group 20.png')),
                  Image.asset('assets/FAFA.png'),
                  // Icon(
                  //   Icons.menu,
                  //   size: 40,
                  //   color: Colors.white,
                  // ),
                  Image.asset('assets/gg_menu.png'),
                ],
              ),
            ),
            selectedLanguage == LanguageSim.chineseSimplified ||
                    selectedLanguage == LanguageSim.chineseTraditional
                ? SizedBox(height: 20)
                : SizedBox(),
            Center(
              child: Text(
                selectedLanguage == 'EN'
                    ? 'Subscribe \nand \nStart Playing'
                    : selectedLanguage == LanguageSim.chineseSimplified
                        ? LanguageSim
                            .subscribeAndStartPlaying // replace with actual Chinese text
                        : LanguageTrad.subscribeAndStartPlaying,
                style: GoogleFonts.kalam(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(-2.0, -2.0),
                      color: Color.fromRGBO(75, 123, 217, 1),
                    ),
                    Shadow(
                      offset: Offset(2.0, -2.0),
                      color: Color.fromRGBO(75, 123, 217, 1),
                    ),
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      color: Color.fromRGBO(75, 123, 217, 1),
                    ),
                    Shadow(
                      offset: Offset(-2.0, 2.0),
                      color: Color.fromRGBO(75, 123, 217, 1),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: height / 20),
            SizedBox(
                height: 100,
                child: Center(child: Image.asset('assets/fafa_icn.png'))),
            SizedBox(height: height / 20),
            Center(
              child: Image.asset('assets/clarity_lock-solid.png'),
            ),
            // Padding(
            //   padding:
            //       const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            //   child: Center(
            //     child: SizedBox(
            //       width: width * 0.8,
            //       height: height / 10,
            //       child: ElevatedButton(
            //         onPressed: () async {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: ((context) => Settings())));
            //         },
            //         style: ElevatedButton.styleFrom(
            //           backgroundColor: Color.fromRGBO(125, 222, 237, 1),
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(25),
            //           ),
            //         ),
            //         child: Center(
            //           child: Text(
            //             selectedLanguage == 'EN'
            //                 ? 'Get access by subscribing 0.99\$/month'
            //                 : selectedLanguage ==
            //                         LanguageSim.chineseSimplified
            //                     ? LanguageSim
            //                         .getAccessBySubscribing0 // replace with actual Chinese text
            //                     : LanguageTrad.getAccessBySubscribing0,
            //             style: GoogleFonts.kanit(
            //               fontSize: 23,
            //               color: Colors.white,
            //               fontWeight: FontWeight.w500,
            //             ),
            //             textAlign: TextAlign.center,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // selectedLanguage == LanguageSim.chineseSimplified ||
            //         selectedLanguage == LanguageSim.chineseTraditional
            //     ? SizedBox(height: height / 20)
            //     : SizedBox(),
            selectedLanguage == LanguageSim.chineseSimplified ||
                    selectedLanguage == LanguageSim.chineseTraditional
                ? SizedBox(height: 20)
                : SizedBox(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Center(
                child: Text(
                  selectedLanguage == 'EN'
                      ? 'Get access by subscribing'
                      : selectedLanguage == LanguageSim.chineseSimplified
                          ? LanguageSim
                              .getAccessBySubscribing0 // replace with actual Chinese text
                          : LanguageTrad.getAccessBySubscribing0,
                  style: GoogleFonts.kanit(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            selectedLanguage == LanguageSim.chineseSimplified ||
                    selectedLanguage == LanguageSim.chineseTraditional
                ? SizedBox(height: 20)
                : SizedBox(),
            Center(
              child: GooglePayButton(
                paymentConfigurationAsset: 'gpay.json',
                paymentItems: const [
                  PaymentItem(
                    label: 'Total',
                    amount: '0.99',
                    status: PaymentItemStatus.final_price,
                  )
                ],
                type: GooglePayButtonType.pay,
                margin: const EdgeInsets.only(top: 15.0),
                onPaymentResult: (result) {
                  String status = result['status'] ?? '';
                  if (status == 'success') {
                    // If payment is successful, redirect to the next screen
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Settings()));
                  } else {
                    // If payment is not successful, remain on the same screen
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => SubscribeScreen())));
                    print('Error code: ${result['errorCode']}');

                    // Uncomment the following line if you want to stay on the same screen after failure
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => SubscribeScreen()));
                  }
                  print(result.toString());
                },
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Center(
                child: SizedBox(
                  // width: width * 0.8,
                  // height: height / 15,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => Settings())));
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      backgroundColor: Color.fromRGBO(79, 123, 218, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Center(
                      child: Text(
                          selectedLanguage == 'EN'
                              ? 'Restore your subscription'
                              : selectedLanguage ==
                                      LanguageSim.chineseSimplified
                                  ? LanguageSim
                                      .restoreYourSubscription // replace with actual Chinese text
                                  : LanguageTrad.restoreYourSubscription,
                          style: GoogleFonts.kanit(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
