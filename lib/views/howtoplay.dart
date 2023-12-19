import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/views/subscribescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../languages/LangS.dart';
import '../languages/LangT.dart';
import 'homepage.dart';

class HowToPlay extends StatefulWidget {
  const HowToPlay({super.key});

  @override
  State<HowToPlay> createState() => _HowToPlayState();
}

class _HowToPlayState extends State<HowToPlay> {
  final List<ListTileModel> items = [
    ListTileModel('assets/mi_filter.png', 'Set', 'Pick your level'),
    ListTileModel('assets/mdi_users-add.png', 'Add',
        'Add players to the game and their names'),
    ListTileModel('assets/mdi_cellphone-message.png', 'Read',
        'Give phone to player one to read the question out loud'),
    ListTileModel('assets/fontisto_cocktail.png', 'Speak or sip',
        'Answer truthfully or keep silent and take a sip'),
    ListTileModel('assets/eva_repeat-outline.png', 'Play and repeat',
        'Pass the phone to the next player and repeat'),
    ListTileModel('assets/solar_star-bold.png', 'Score',
        'Check who scores the most points and play again!'),
    // Add more items
  ];

  final List<ListTileModel> items1 = [
    ListTileModel('assets/mi_filter.png', LanguageSim.set,
        LanguageSim.pickYourLevelHardOrEasy),
    ListTileModel('assets/mdi_users-add.png', LanguageSim.add,
        LanguageSim.addPlayersToTheGameAndTheirNames),
    ListTileModel('assets/mdi_cellphone-message.png', LanguageSim.read,
        LanguageSim.giveThePhoneToPlayerOneToReadTheQuestionOutLoud),
    ListTileModel('assets/fontisto_cocktail.png', LanguageSim.speakOrSip,
        LanguageSim.answerTruthfullyOrKeepSilentAndTakeASip),
    ListTileModel('assets/eva_repeat-outline.png', LanguageSim.playAndRepeat,
        LanguageSim.passThePhoneToTheNextPlayerAndRepeat),
    ListTileModel('assets/solar_star-bold.png', LanguageSim.score,
        LanguageSim.checkWhoScoresTheMostPointsAndPlayAgain),
    // Add more items
  ];

  final List<ListTileModel> items2 = [
    ListTileModel('assets/mi_filter.png', LanguageTrad.set,
        LanguageTrad.pickYourLevelHardOrEasy),
    ListTileModel('assets/mdi_users-add.png', LanguageTrad.add,
        LanguageTrad.addPlayersToTheGameAndTheirNames),
    ListTileModel('assets/mdi_cellphone-message.png', LanguageTrad.read,
        LanguageTrad.giveThePhoneToPlayerOneToReadTheQuestionOutLoud),
    ListTileModel('assets/fontisto_cocktail.png', LanguageTrad.speakOrSip,
        LanguageTrad.answerTruthfullyOrKeepSilentAndTakeASip),
    ListTileModel('assets/eva_repeat-outline.png', LanguageTrad.playAndRepeat,
        LanguageTrad.passThePhoneToTheNextPlayerAndRepeat),
    ListTileModel('assets/solar_star-bold.png', LanguageTrad.score,
        LanguageTrad.checkWhoScoresTheMostPointsAndPlayAgain),
    // Add more items
  ];

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height / 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => HomePage())));
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
            SizedBox(
              height: height / 15,
              child: Center(
                child: Text(
                  selectedLanguage == 'EN'
                      ? 'How to Play'
                      : selectedLanguage == LanguageSim.chineseSimplified
                          ? LanguageSim
                              .howToPlay // replace with actual Chinese text
                          : LanguageTrad.howToPlay,
                  style: GoogleFonts.kalam(
                    fontSize: 28,
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
            ),
            SizedBox(
              width: width,
              height: height * 0.65,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color.fromRGBO(240, 99, 243, 1),
                          width: 3.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ClipOval(
                          child: Image.asset(
                            items[index].iconData.toString(),
                            color: Colors.white,
                            width: 25,
                            height: 25,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                        selectedLanguage == 'EN'
                            ? items[index].titleText
                            : selectedLanguage == LanguageSim.chineseSimplified
                                ? items1[index].titleText
                                : items2[index].titleText,
                        style: GoogleFonts.kanit(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        )),
                    subtitle: Text(
                        selectedLanguage == 'EN'
                            ? items[index].subTitleText
                            : selectedLanguage == LanguageSim.chineseSimplified
                                ? items1[index].subTitleText
                                : items2[index].subTitleText,
                        style: GoogleFonts.kanit(
                          fontSize: selectedLanguage ==
                                      LanguageSim.chineseSimplified ||
                                  selectedLanguage ==
                                      LanguageTrad.chineseTraditional
                              ? 18
                              : 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        )),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Center(
                  child: SizedBox(
                    width: width * 0.8,
                    height: height / 11,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => SubscribeScreen())));
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
                                ? 'GOT IT'
                                : selectedLanguage ==
                                        LanguageSim.chineseSimplified
                                    ? LanguageSim
                                        .gotIt // replace with actual Chinese text
                                    : LanguageTrad.gotIt,
                            style: GoogleFonts.kanit(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
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

class ListTileModel {
  String iconData;
  String titleText;
  String subTitleText;

  ListTileModel(this.iconData, this.titleText, this.subTitleText);
}
