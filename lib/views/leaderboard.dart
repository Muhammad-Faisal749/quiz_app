import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quiz_app/views/startagain.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';

import '../languages/LangS.dart';
import '../languages/LangT.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key, this.playerScores, this.totalScore});

  final Map<String, int>? playerScores;
  final int? totalScore;

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  int rating = 0;

  String? selectedLanguage;

  getLanguage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      selectedLanguage = pref.getString('language');
    });
  }

  @override
  void initState() {
    getLanguage();
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _showRatingDialog();
    });
  }

// Create a stream controller for rating updates
// Create a stream controller for rating updates
  StreamController<int> ratingStreamController = StreamController<int>();
  int currentRating = 0;

  @override
  void dispose() {
    ratingStreamController.close();
    super.dispose();
  }

  void _showRatingDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                selectedLanguage == 'EN'
                    ? 'Your opinion matters to us!'
                    : selectedLanguage == LanguageSim.chineseSimplified
                        ? LanguageSim
                            .yourOpinionMattersToUs // replace with actual Chinese text
                        : LanguageTrad.yourOpinionMattersToUs,
                style: TextStyle(
                  fontSize: 23,
                  color: Color.fromRGBO(55, 55, 55, 1),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                selectedLanguage == 'EN'
                    ? 'How would you rate our app?'
                    : selectedLanguage == LanguageSim.chineseSimplified
                        ? LanguageSim
                            .howWouldYouRateOurApp // replace with actual Chinese text
                        : LanguageTrad.howWouldYouLikeToRateOurApp,
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(55, 55, 55, 1),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              StreamBuilder<int>(
                stream: ratingStreamController.stream,
                initialData: currentRating,
                builder: (context, snapshot) {
                  currentRating = snapshot.data!;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return GestureDetector(
                        onTap: () {
                          ratingStreamController.add(index + 1);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(
                            Icons.star,
                            color: index < currentRating
                                ? Colors.amber // Golden color when selected
                                : Colors.grey, // Grey color when not selected
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(240, 99, 243, 1),
                ),
                child: Text(
                  selectedLanguage == 'EN'
                      ? 'Submit'
                      : selectedLanguage == LanguageSim.chineseSimplified
                          ? LanguageSim
                              .submit // replace with actual Chinese text
                          : LanguageTrad.submit,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  print("User rating is $currentRating");
                },
              ),
            ],
          ),
        );
      },
    );
  }

// Dispose of the stream controller when it's no longer needed

  Future<void> takeSelfie() async {
    final PermissionStatus status = await Permission.camera.request();

    if (status.isGranted) {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);

      if (image != null) {
        final String imagePath = image.path;
        Share.shareFiles([imagePath], text: 'Look at my selfie!');
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Permission not granted'),
            content: Text(
                'You have denied the camera permission for this app. To take a selfie, please allow camera access in your settings.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> shareScore() async {
    String scores = widget.playerScores!.entries
        .map((e) => '${e.key}: ${e.value}')
        .join('\n');

    int overalltotalScore =
        widget.playerScores!.values.reduce((value, element) => value + element);

    String totalScore = '\nTotal Score: ' + overalltotalScore.toString();
    String shareText = 'Check out my quiz score!\n$scores\n$overalltotalScore';

    await Share.share(shareText);
  }

  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: width / 7),
                      Image.asset('assets/FAFA.png'),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => StartAgain())));
                          },
                          child: Image.asset('assets/Group 23.png')),
                    ],
                  ),
                  SizedBox(height: height / 30),
                  Center(
                    child: AutoSizeText(
                      selectedLanguage == 'EN'
                          ? 'CONGRATULATIONS'
                          : selectedLanguage == LanguageSim.chineseSimplified
                              ? LanguageSim
                                  .congratulations // replace with actual Chinese text
                              : LanguageTrad.congratulations,
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
                      maxLines: 1, // Set the maximum number of lines to 1
                    ),
                  ),
                  SizedBox(height: height / 40),
                  Center(child: Image.asset('assets/fxemoji_trophy.png')),
                  SizedBox(height: height / 20),
                  Container(
                    // height: height / 2.7,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.topLeft,
                        colors: [
                          Color.fromRGBO(243, 195, 255, 1),
                          Color.fromRGBO(255, 198, 222, 1),
                          Color.fromRGBO(255, 239, 180, 1),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.playerScores!.entries.map((entry) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${entry.key}: ',
                                    style: GoogleFonts.kanit(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    )),
                                Text('${entry.value}',
                                    style: GoogleFonts.kanit(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height / 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Center(
                      child: SizedBox(
                        width: width * 0.8,
                        height: height / 15,
                        child: ElevatedButton(
                          onPressed: () {
                            shareScore();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(173, 223, 146, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Center(
                            child: AutoSizeText(
                                selectedLanguage == 'EN'
                                    ? 'Share your Score'
                                    : selectedLanguage ==
                                            LanguageSim.chineseSimplified
                                        ? LanguageSim
                                            .shareYourScore // replace with actual Chinese text
                                        : LanguageTrad.shareYourScore,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Center(
                      child: SizedBox(
                        width: width * 0.8,
                        height: height / 15,
                        child: ElevatedButton(
                          onPressed: () {
                            takeSelfie();
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
                                    ? 'Take a Selfie'
                                    : selectedLanguage ==
                                            LanguageSim.chineseSimplified
                                        ? LanguageSim
                                            .takeASelfie // replace with actual Chinese text
                                        : LanguageTrad.takeASelfie,
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
        ),
      ),
    );
  }
}
