import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/views/privacypolicy.dart';
import 'package:quiz_app/views/subscribescreen.dart';
import 'package:quiz_app/views/termsandcondition.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../languages/LangS.dart';
import '../languages/LangT.dart';
import 'lobby.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String? selectedLanguage;

  getLanguage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      selectedLanguage = pref.getString('language');
    });
  }

  storeDifficulty() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print('DIFFICULTY IS' + selectedDifficulty.toString());
    pref.setString('difficulty', selectedDifficulty!);
  }

  @override
  void initState() {
    // TODO: implement initState
    getLanguage();
    super.initState();
  }

  String assetImageEasy = 'assets/emojione-v1_ballot-box-bold-check-1.png';
  String assetImageHard = 'assets/emojione-v1_ballot-box-bold-check-1.png';

  String? selectedDifficulty;

  Row buildDifficultyOptionRow(double width, String difficultyLevel) {
    String currentAsset;

    if (selectedDifficulty == difficultyLevel) {
      currentAsset = 'assets/emojione-v1_ballot-box-bold-check.png';
    } else {
      currentAsset = 'assets/emojione-v1_ballot-box-bold-check-1.png';
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedDifficulty = difficultyLevel;
              storeDifficulty();
            });
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LobbyScreen()));
          },
          child: Image.asset(currentAsset),
        ),
        SizedBox(width: width / 8),
        Text(difficultyLevel,
            style: GoogleFonts.kanit(
              fontSize: 23,
              color: Color.fromRGBO(75, 123, 217, 1),
              fontWeight: FontWeight.w400,
            )),
      ],
    );
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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => SubscribeScreen())));
                    },
                    child: Image.asset('assets/Group 20.png')),
                SizedBox(height: height / 30),
                Center(
                  child: Text(
                    selectedLanguage == 'EN'
                        ? 'SETTINGS'
                        : selectedLanguage == LanguageSim.chineseSimplified
                            ? LanguageSim
                                .settings // replace with actual Chinese text
                            : LanguageTrad.settings,
                    style: GoogleFonts.kalam(
                      fontSize: 38,
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
                Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(125, 222, 237, 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            selectedLanguage == 'EN'
                                ? 'Difficult Level'
                                : selectedLanguage ==
                                        LanguageSim.chineseSimplified
                                    ? LanguageSim
                                        .difficultLevel // replace with actual Chinese text
                                    : LanguageTrad.difficultLevel,
                            style: GoogleFonts.kanit(
                              fontSize: 36,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  offset: Offset(-1.0, -1.0),
                                  color: Color.fromRGBO(75, 123, 217, 1),
                                ),
                                Shadow(
                                  offset: Offset(1.0, -1.0),
                                  color: Color.fromRGBO(75, 123, 217, 1),
                                ),
                                Shadow(
                                  offset: Offset(1.0, 1.0),
                                  color: Color.fromRGBO(75, 123, 217, 1),
                                ),
                                Shadow(
                                  offset: Offset(-1.0, 1.0),
                                  color: Color.fromRGBO(75, 123, 217, 1),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        buildDifficultyOptionRow(
                          width,
                          selectedLanguage == 'EN'
                              ? 'Hard'
                              : selectedLanguage ==
                                      LanguageSim.chineseSimplified
                                  ? LanguageSim
                                      .hard // replace with actual Chinese text
                                  : LanguageTrad.hard,
                        ),
                        buildDifficultyOptionRow(
                          width,
                          selectedLanguage == 'EN'
                              ? 'Easy'
                              : selectedLanguage ==
                                      LanguageSim.chineseSimplified
                                  ? LanguageSim
                                      .easy // replace with actual Chinese text
                                  : LanguageTrad.easy,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height / 20),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Center(
                    child: SizedBox(
                      width: width * 0.8,
                      height: height / 15,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PrivacyPolicy()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(79, 123, 218, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Center(
                          child: Text(
                              selectedLanguage == 'EN'
                                  ? 'Privacy Policy'
                                  : selectedLanguage ==
                                          LanguageSim.chineseSimplified
                                      ? LanguageSim
                                          .privacyPolicy // replace with actual Chinese text
                                      : LanguageTrad.privacyPolicy,
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Center(
                    child: SizedBox(
                      width: width * 0.8,
                      height: height / 15,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TermsAndCondition()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(79, 123, 218, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Center(
                          child: Text(
                              selectedLanguage == 'EN'
                                  ? 'Terms of Use'
                                  : selectedLanguage ==
                                          LanguageSim.chineseSimplified
                                      ? LanguageSim
                                          .termsOfUse // replace with actual Chinese text
                                      : LanguageTrad.termsOfUse,
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
        ),
      ),
    );
  }
}
