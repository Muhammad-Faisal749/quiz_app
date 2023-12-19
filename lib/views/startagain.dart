import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/views/settings.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../languages/LangS.dart';
import '../languages/LangT.dart';

class StartAgain extends StatefulWidget {
  const StartAgain({Key? key});

  @override
  _StartAgainState createState() => _StartAgainState();
}

class _StartAgainState extends State<StartAgain> {
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
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: height / 40),
              Image.asset('assets/FAFA.png'),
              SizedBox(height: height / 20),
              Center(child: Image.asset('assets/fafa_icn.png')),
              SizedBox(height: height / 20),
              Center(
                child: Text(
                  selectedLanguage == 'EN'
                      ? 'READY FOR\n MORE FUN?'
                      : selectedLanguage == LanguageSim.chineseSimplified
                          ? LanguageSim
                              .readyForMoreFun // replace with actual Chinese text
                          : LanguageTrad.readyForMoreFun,
                  style: GoogleFonts.kalam(
                    fontSize: 38,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(-1.0, -1.0),
                        color: Color.fromRGBO(240, 99, 243, 1),
                      ),
                      Shadow(
                        offset: Offset(1.0, -1.0),
                        color: Color.fromRGBO(240, 99, 243, 1),
                      ),
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        color: Color.fromRGBO(240, 99, 243, 1),
                      ),
                      Shadow(
                        offset: Offset(-1.0, 1.0),
                        color: Color.fromRGBO(240, 99, 243, 1),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: height / 100),
              Image.asset('assets/Group 24.png'),
              SizedBox(height: height / 25),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  child: Center(
                    child: SizedBox(
                      width: width * 0.8,
                      height: height / 10,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => Settings()),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(240, 99, 243, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            selectedLanguage == 'EN'
                                ? 'Start Again'
                                : selectedLanguage ==
                                        LanguageSim.chineseSimplified
                                    ? LanguageSim
                                        .startAgain // replace with actual Chinese text
                                    : LanguageTrad.startAgain,
                            style: GoogleFonts.kanit(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
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
