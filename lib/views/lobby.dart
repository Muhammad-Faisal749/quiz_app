import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/views/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../languages/LangS.dart';
import '../languages/LangT.dart';
import 'gameplay.dart';

class LobbyScreen extends StatefulWidget {
  const LobbyScreen({super.key});

  @override
  State<LobbyScreen> createState() => _LobbyScreenState();
}

class _LobbyScreenState extends State<LobbyScreen> {
  int playerCount = 0;
  List<String> playerList = [];

  void _addPlayer() {
    if (playerCount < 6) {
      setState(() {
        playerCount++;
        playerList.add('Player $playerCount');
      });
    }
  }

  void _addPlayerch() {
    if (playerCount < 6) {
      setState(() {
        playerCount++;
        playerList.add('玩家 $playerCount');
      });
    }
  }

  void _addPlayerct() {
    if (playerCount < 6) {
      setState(() {
        playerCount++;
        playerList.add('玩家 $playerCount');
      });
    }
  }

  void _removePlayer(int index) {
    setState(() {
      playerList.removeAt(index);
      playerCount--;
    });
  }

  void _editPlayer(int index) async {
    TextEditingController controller =
        TextEditingController(text: playerList[index]);

    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(selectedLanguage == 'EN'
                ? 'Edit Player Name'
                : selectedLanguage == LanguageSim.chineseSimplified
                    ? '编辑玩家姓名' // replace with actual Chinese text
                    : '編輯玩家姓名'),
            content: TextFormField(
              controller: controller,
            ),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(selectedLanguage == 'EN'
                    ? 'Cancel'
                    : selectedLanguage == LanguageSim.chineseSimplified
                        ? '取消' // replace with actual Chinese text
                        : '取消'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    playerList[index] = controller.text;
                  });
                  Navigator.of(context).pop();
                },
                child: Text(selectedLanguage == 'EN'
                    ? 'Save'
                    : selectedLanguage == LanguageSim.chineseSimplified
                        ? '节省' // replace with actual Chinese text
                        : '節省'),
              )
            ],
          );
        });
  }

  void _showPlayerList() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
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
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  selectedLanguage == 'EN'
                      ? '${playerList.length} players. Are you done?'
                      : selectedLanguage == LanguageSim.chineseSimplified
                          ? '${playerList.length} 玩家。你做完了吗？' // replace with actual Chinese text
                          : '${playerList.length} 玩家。你做完了嗎？',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ...playerList
                    .map((player) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(player,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18)),
                        ))
                    .toList(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        selectedLanguage == 'EN'
                            ? 'No'
                            : selectedLanguage == LanguageSim.chineseSimplified
                                ? LanguageSim
                                    .no // replace with actual Chinese text
                                : LanguageTrad.no,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (playerList.isEmpty) {
                          // Show a SnackBar if playerList is empty
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.blue,
                              padding: EdgeInsets.all(8),
                              showCloseIcon: true,
                              content: Text(
                                selectedLanguage == 'EN'
                                    ? 'Please Add player'
                                    : selectedLanguage == LanguageSim.chineseSimplified
                                    ? LanguageSim.pleaseAddPlayer
                                    : LanguageTrad.pleaseAddPlayer,
                              ),
                            ),
                          );
                          Navigator.pop(context);
                        } else {
                          // Navigate to GamePlay screen if playerList is not empty
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GamePlay(
                                numberofplayers: playerCount,
                                players: playerList,
                                language: selectedLanguage.toString(),
                              ),
                            ),
                          );
                        }
                      },
                      child: Text(
                        selectedLanguage == 'EN'
                            ? 'Yes'
                            : selectedLanguage == LanguageSim.chineseSimplified
                            ? LanguageSim.yes
                            : LanguageTrad.yes,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String? selectedLanguage;

  getLanguage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      selectedLanguage = pref.getString('language');
      print("Language Selected is" + selectedLanguage.toString());
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
        child: SafeArea(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => Settings())));
                                },
                                child: Image.asset('assets/Group 20.png')),
                            Image.asset('assets/FAFA.png'),
                            Image.asset('assets/gg_menu.png'),
                          ],
                        ),
                      ),
                      Container(
                        height: playerCount == 6 ? height * 0.6 : height * 0.5,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        width: width,
                        child: ListView.builder(
                          itemCount: playerList.length,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: ListTile(
                                  title: Text(
                                    playerList[index],
                                    style: GoogleFonts.kanit(
                                      fontSize: 22,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  onTap: () => _editPlayer(index),
                                  trailing: index >= 2
                                      ? GestureDetector(
                                          onTap: () => _removePlayer(index),
                                          child: Image.asset(
                                              'assets/material-symbols_cancel.png'))
                                      : null,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      playerCount == 6
                          ? SizedBox()
                          : Center(
                              child: GestureDetector(
                                onTap: () {
                                  selectedLanguage == 'EN'
                                      ? _addPlayer()
                                      : selectedLanguage ==
                                              LanguageSim.chineseSimplified
                                          ? _addPlayerch() // replace with actual Chinese text
                                          : _addPlayerct();
                                },
                                child: Image.asset('assets/formkit_add.png'),
                              ),
                            ),
                      playerCount == 6
                          ? SizedBox(height: height / 20)
                          : SizedBox(),
                      Center(
                        child: Text(
                            selectedLanguage == 'EN'
                                ? 'Add players to start'
                                : selectedLanguage ==
                                        LanguageSim.chineseSimplified
                                    ? LanguageSim
                                        .addPlayersToStart // replace with actual Chinese text
                                    : LanguageTrad.addPlayersToStart,
                            style: GoogleFonts.kanit(
                              fontSize: 26,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                    ],
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
                            _showPlayerList();
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
                                    ? 'Play'
                                    : selectedLanguage ==
                                            LanguageSim.chineseSimplified
                                        ? LanguageSim
                                            .play // replace with actual Chinese text
                                        : LanguageTrad.play,
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
            ],
          ),
        ),
      ),
    );
  }
}
