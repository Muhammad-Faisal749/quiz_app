import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../languages/LangS.dart';
import '../languages/LangT.dart';
import 'howtoplay.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _selectedLanguage = LanguageSim.chineseSimplified;

  getLanguage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _selectedLanguage = pref.getString('language');
      if (_selectedLanguage != null) {
        _selectedLanguage = pref.getString('language');
      } else {
        _selectedLanguage = LanguageSim.chineseSimplified;
      }
    });
  }

  Future<void> _initializeApp() async {
    // Call setupQuestions to initialize questions
    await getLanguage();
  }

  @override
  void initState() {
    _initializeApp();
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
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: height / 15),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: width / 4),
                    Center(child: Image.asset('assets/FAFA.png')),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SizedBox(
                        width: 100,
                        height: 80,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            icon: SizedBox(),
                            isExpanded: true,
                            dropdownColor: Color.fromRGBO(75, 123, 217, 1),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            value: _selectedLanguage == '' ||
                                    _selectedLanguage == null
                                ? 'EN'
                                : _selectedLanguage,
                            items: <String>[
                              'EN',
                              LanguageSim.chineseSimplified,
                              LanguageTrad.chineseTraditional
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color.fromRGBO(240, 99, 243, 1),
                                      width: 3,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Center(
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) async {
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              setState(() {
                                _selectedLanguage = newValue!;
                              });
                              await pref.setString('language', newValue!);
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height / 40),
              Center(
                child: Text(
                  _selectedLanguage == 'EN'
                      ? 'GET CLOSER\nTO YOUR FRIENDS'
                      : _selectedLanguage == LanguageSim.chineseSimplified
                          ? LanguageSim
                              .getCloserToYourFriends // replace with actual Chinese text
                          : LanguageTrad.getCloserToYourFriends,
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
              SizedBox(height: height / 40),
              Center(child: Image.asset('assets/fafa_icn.png')),
              SizedBox(height: height / 40),
              Center(
                child: Text(
                  _selectedLanguage == 'EN'
                      ? 'While\nHaving Fun'
                      : _selectedLanguage == LanguageSim.chineseSimplified
                          ? LanguageSim
                              .whileHavingFun // replace with actual Chinese text
                          : LanguageTrad.whileHavingFun,
                  style: GoogleFonts.kalam(
                    fontSize: 28,
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
                                builder: ((context) => HowToPlay())));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(240, 99, 243, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Center(
                        child: Text(
                            _selectedLanguage == 'EN'
                                ? 'How to Play'
                                : _selectedLanguage ==
                                        LanguageSim.chineseSimplified
                                    ? LanguageSim
                                        .howToPlay // replace with actual Chinese text
                                    : LanguageTrad.howToPlay,
                            style: GoogleFonts.kanit(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
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
    );
  }
}
