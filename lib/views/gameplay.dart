import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../languages/LangS.dart';
import '../languages/LangT.dart';
import 'leaderboard.dart';
import 'lobby.dart';

class GamePlay extends StatefulWidget {
  const GamePlay({
    Key? key,
    this.numberofplayers,
    this.players,
    this.language,
  }) : super(key: key);

  final int? numberofplayers;
  final List<String>? players;
  final String? language;

  @override
  State<GamePlay> createState() => _GamePlayState();
}

class _GamePlayState extends State<GamePlay> {
  int totalScore = 0;
  int? questionsAllowed;
  // Add a list of questions.
  List<String> questions = [];
  String? selectedDifficulty;

  Map<String, int> playerScores = {};

  // Add a variable to keep track of the current question.
  int currentQuestionIndex = 0;
  int questionsPerPlayer = 0;

  Map<String, int>? allQuestions;

  Future setupQuestions() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      selectedLanguage = pref.getString('language');
      selectedDifficulty = pref.getString('difficulty');
    });

    print('Language selected is' + selectedLanguage.toString());
    switch (widget.language) {
      case 'EN':
        allQuestions = {
          'What was the thing that you regret buying?': 3,
          'What was the most abnormal or daring food that you have eaten?': 3,
          'Did you ever taste your pet’s food?': 4,
          'Do you sing in the shower?': 1,
          'Which is your favorite song to hum in the shower?': 2,
          'What is the worst gift you have ever received?': 2,
          'What is your favourite movie?': 2,
          'What would it be the first thing you would do if you get rich?': 2,
          'If a genie granted you three wishes, what would you ask for?': 1,
          'What was the craziest thing you did for love?': 3,
          'Did you ever have a crush on a high school teacher?': 4,
          'Have you ever lied to your partner or friend?': 5,
          'Narrate your first breakup story giving all details.': 3,
          'At which age did you have your first kiss and with whom?': 4,
          'Did you ever break up with an ex right before their birthday to avoid buying them a birthday gift?':
              4,
          'Do you have the hots for someone at your workplace?': 5,
          'Did you ever have a dating app profile?': 3,
          'Do you believe in love at first sight?': 1,
          'All players name their celebrity crush or get 1 punishment': 0,
          'If you were a K-Pop singer, who would you be?': 2,
          'From 1 to 10, how good looking are you?': 4,
          'What´s your favorite part of your body?': 4,
          'What will you change in your body, if you could?': 5,
          'Which actor would you swap your life with for 10 days?': 1,
          'What is your favorite time of the year?': 1,
          'Will you allow me to check the browsing history on your mobile?': 5,
          'Which animal comes to your mind when you think of the player at your right hand side?':
              4,
          'Rate the style of all player´s dressing on a scale of 1 to 10.': 3,
          'Which is the most embarrassing show you are guilty of watching?': 4,
          'Name two of your guilty pleasures.': 3,
          'When was the longest time you have stayed in a bathroom and why?': 5,
          'What’s the biggest secret you’ve kept from your parents?': 2,
          'What’s the most embarrassing music you listen to?': 3,
          'What’s your biggest regret?': 3,
          'Which player would survive a zombie apocalypse and which would be the first to go?':
              2,
          'Who is your secret crush?': 5,
          'Like your crush\'s recent photo in social media or get 2 punishments':
              0,
          'What excuse have you used before to get out of plans?': 3,
          'How was your first kiss?': 4,
          'Read the last text you sent to your best friend or significant other out loud':
              5,
          'What was your biggest lie?': 4,
          'How many selfies do you take a day?': 4,
          'What’s the longest time you´ve ever gone without showering?': 3,
          'If you could change your name, what would your first name be?': 1,
          'If you could have a superpower, what would it be?': 1,
          'What is your biggest fear?': 3,
          'Who do you text the most?': 2,
          'Have you ever been fired from a job?': 4,
          'If you could only eat one thing for the rest of your life, what would you choose?':
              2,
          'What´s the worst physical pain you´ve ever experienced?': 3,
          'Have you ever gone skinny dipping?': 4,
          'What is your worst habit?': 3,
          'Do you pee in the shower?': 5,
          'Do you still have feelings for any of your exes?': 5,
          'What song makes you emotional when you listen to it?': 2,
          'If you were handed 10,000 CNY right now, what would you spend it on?':
              2,
          'Have you ever cheated on an exam?': 5,
          'If you had to get a tattoo today, what would it be?': 2,
          'What makes you feel loved?': 1,
          'Name your go-to karaoke song.': 2,
          'What´s the most adventurous thing you’ve ever done?': 3,
          'What´s the luckiest thing that´s ever happened to you?': 2,
          'If you had to move to a different country tomorrow, where would you go?':
              1,
          'Do you believe in soul mates?': 2,
          'Have you ever re-gifted a present? What was it?': 3,
          'What´s the weirdest thing you do when you’re alone?': 4,
          'What gross food combo do you secretly love?': 3,
          'What´s the most embarrassing nickname you´ve ever been given?': 4,
          'If you could trade lives with any person for a day, who would it be?':
              2,
          'What´s the longest you’ve ever gone without brushing your teeth?': 3,
          'Do you believe in aliens?': 1,
          'Have you ever given a fake phone number?': 2,
          'What´s the most important for you: love or money?': 4,
          'Name the player that you like the most or get 2 punishments': 0,
          'Have you ever peed yourself?': 5,
          'Who was your worst kiss ever?': 4,
          'What is the most drunk you ever have?': 3,
          'If you were the opposite sex for one day, what would you do?': 2,
          'Who is your favourite family member?': 3,
          'Tell us your most embarrassing vomit history?': 4,
          'Has anyone accidentally saw you naked?': 5,
          'Have you ever cheated on someone?': 5,
          'Have you ever accidentally hit something or someone with your car?':
              3,
          'Have you ever faked sick to get out of a party?': 2,
          'Do you believe in any superstitions?': 1,
          'How many times a week do you wear the same pants?': 3,
          'Have you ever peed in a pool?': 5,
          'What app do you waste the most time on?': 1,
          'If any player have already lied about their age, get 1 punishment each.':
              0,
          'Which of your family members annoys you the most?': 4,
          'If any player have already lied to their boss, get 1 punishment each.':
              0,
          'Describe the weirdest thing you’ve ever done while drunk': 3,
          'How many photo editing apps do you have in your phone?': 2,
          'Get 1 punishment': 0,
          'What always makes you laugh?': 1,
          'Get 2 punishments': 0,
          'All players get 1 punishment': 0,
          'What makes you feel nervous?': 2,
          'Name 2 things you are grateful for.': 2,
          'How did your parents influenced your goals in life?': 2,
          'Who has most items in Taobao\'s cart gets 1 punishment': 0,
          'Who has more screentime in their phone gets 1 punishment': 0,
          'Take a selfie with a stranger or get 2 punishments': 0,
          'Would you date someone shorter than you?': 2,
          'How many people have you kissed?': 3,
          'Have you ever been on a fight?': 4,
          'Have you ever gotten blackout drunk?': 3,
          'Who´s your hero?': 1,
          'What is your dream destination?': 1,
          'Do you ever drool in your sleep?': 3,
          'What is your favourite Disney character?': 2,
          'The player with more items in his Taobao shopping cart get 1 punishment':
              0,
          'Name a person you are jealous of?': 5,
          'Let another player post a status on your social': 5,
          'Show the most embarrassing photo in your phone or get 1 punishment':
              0,
          'Empty your wallet or purse and show everybody what is inside or get 1 punishment':
              0,
        };
        break;
      case '简体中文':
        allQuestions = {
          '你后悔买过什么东西？': 3,
          '你吃过最反常或最需要勇气的食物是什么？': 3,
          '你尝过宠物的食物吗？': 4,
          '你会在洗澡时唱歌吗？': 1,
          '你最喜欢在洗澡时哼唱什么歌？': 2,
          '你收过最糟糕的礼物是什么？': 2,
          '你最喜欢的电影是哪一部？': 2,
          '要是你一夜暴富，你想做的第一件事是什么？': 2,
          '如果神灯精灵让你许三个愿望，你会许什么愿望？': 1,
          '你为爱做过做疯狂的事是什么？': 3,
          '你有没有暗恋过高中老师？': 4,
          '你曾经对伴侣或朋友撒过谎吗？': 5,
          '仔细说说你第一次分手的故事。': 3,
          '你的初吻发生在几岁？和谁有了初吻？': 4,
          '你有没有试过在前任的生日前跟前任分手，就为了避免给他们送生日礼物？': 4,
          '你会对办公的同事有好感吗？': 5,
          '你有没有用过交友软件？': 3,
          '你相信一见钟情吗？': 1,
          '所有玩家都要说出自己喜欢的明星艺人，否则就要接受1次惩罚': 0,
          '如果你是个韩流歌手，那你会是谁？': 2,
          '1到10分，你觉得你的好看程度能得几分？': 4,
          '你最喜欢身体的哪个部位？': 4,
          '如果可以的话，你想改变身体的什么地方？': 5,
          '你会想要和哪个演员交换10天的寿命？': 1,
          '一年之中你最喜欢什么时候？': 1,
          '你会允许我看你手机的浏览记录吗？': 5,
          '看到右边的玩家时，你会第一时间想到哪种动物？': 4,
          '1到10分，请为所有玩家的打扮风格打分。': 3,
          '你看过最羞于启齿的节目是什么？': 4,
          '请说出两个你羞于启齿但做了感觉很美好的癖好。': 3,
          '你在浴室待最长时间是什么时候？为什么？': 5,
          '你对父母隐瞒的最大秘密是什么？': 2,
          '你听过最羞于启齿的音乐是什么？': 3,
          '你最遗憾的是什么？': 3,
          '你觉得现场哪个玩家能在僵尸末日中生存下来？而哪个玩家会最先阵亡？': 2,
          '你的暗恋对象是谁？': 5,
          '到社交媒体上给你暗恋对象的近期照片点赞，否则就接受2次惩罚': 0,
          '你曾用过什么借口来摆脱安排？（工作、约会等）': 3,
          '你的初吻感觉如何？': 4,
          '大声朗读你发送给好友或其它重要的人的最后一条信息': 5,
          '你撒过最大的谎是什么？': 4,
          '你一天自拍几次？': 4,
          '你最长多久没洗澡？': 3,
          '如果要改名，你想改成什么名字？': 1,
          '如果你能有超能力，那你想要有什么样的超能力？': 1,
          '你最害怕的是什么？': 3,
          '你最常给谁发送信息？': 2,
          '你有没有被炒过鱿鱼？': 4,
          '如果你余生只能吃一种食物，你会选择吃什么？': 2,
          '你经历过最痛的生理性疼痛是什么？': 3,
          '你裸泳过吗？': 4,
          '你最糟糕的习惯是什么？': 3,
          '你会在一边淋浴一边尿尿吗？': 5,
          '你对前任还有感觉吗？': 5,
          '什么歌会让你听了很感动？': 2,
          '如果你现在有1万元，你会把钱花在什么东西上？': 2,
          '你有没有在考试时作弊？': 5,
          '如果你要去纹身，你想纹什么？': 2,
          '是什么会让你感到自己备受宠爱？': 1,
          '说一首你K歌时必唱的歌曲.': 2,
          '你做过最冒险的事情是什么？': 3,
          '你经历过最幸运的事是什么？': 2,
          '如果明天就要移民到其他国家，你想到哪个国家？': 1,
          '你相信灵魂伴侣吗？': 2,
          '你有没有将收到的礼物转送给别人？那是什么礼物？': 3,
          '你独自一人的时候做过最奇怪的事情是什么？': 4,
          '你私底下最喜欢什么样的恶心食物组合？': 3,
          '你被人取过最尴尬的绰号是什么？': 4,
          '如果你能和某个人交换一天的人生，哪个人会是谁？': 2,
          '你最长多久不刷牙？': 3,
          '你相信有外星人吗？': 1,
          '你有没有给过别人假的电话号码？': 2,
          '爱情和金钱，哪个对你来说最重要？': 4,
          '说出你最喜欢的玩家，否则接受2次惩罚': 0,
          '你有没有试过失禁？': 5,
          '你接过最糟糕的吻是和谁？': 4,
          '你喝得最醉的时候是什么时候？': 3,
          '如果你能享受一天的变性效果，你想做什么？': 2,
          '你最喜欢的家人是谁？': 3,
          '告诉我们你最尴尬的呕吐经历？': 4,
          '有没有人不小心看到你的不穿衣服的模样？': 5,
          '你有没有试过一脚踏两船？': 5,
          '你的车子有没有不小心撞到人或东西？': 3,
          '你有没有试过装病来不出席派对？': 2,
          '你有没有任何迷信观念？': 1,
          '你一周会穿同一条裤子几次？': 3,
          '你试过在泳池里撒尿吗？': 5,
          '你在哪个应用程序上消耗最多时间？': 1,
          '谎报年龄的玩家，每个人都要接受1次惩罚。': 0,
          '你最讨厌哪个家人？': 4,
          '曾对老板撒谎的玩家，每个人都要接受1次惩罚。': 0,
          '描述你喝醉时做过最奇怪的事': 3,
          '你手机里有多少个修图应用程序？': 2,
          '接受1次惩罚': 0,
          '是什么会让你每次都开怀大笑？': 1,
          '接受2次惩罚': 0,
          '所有玩家接受1次惩罚': 0,
          '什么会让你感到紧张？': 2,
          '讲述你最感激的两件事。': 2,
          '你的父母如何影响你决定自己的人生目标？': 2,
          '谁的淘宝购物车里的东西最多，就要接受1次惩罚': 0,
          '谁的手机使用时间最长，就要接受1次惩罚': 0,
          '和一个陌生人自拍一张，否则接受2次惩罚': 0,
          '你会和比你矮的人约会吗？': 3,
          '你吻过多少人？': 4,
          '你打过架吗？': 3,
          '你有没有试过喝酒喝断片？': 1,
          '谁是你的英雄？': 1,
          '你的梦想目的地是哪里？': 3,
          '你睡觉时会流口水吗？': 2,
          '你最喜欢的迪斯尼角色是谁？': 1,
          '淘宝购物车里东西最多的玩家要接受1次惩罚': 0,
          '说出一个你嫉妒的人？': 5,
          '让其他玩家在你的社交媒体上发布动态': 1,
          '展示手机里最尴尬的照片，否则接受1次惩罚': 0,
          '清空钱包并展示里头的东西，否则要接受1次惩罚': 0,
        };
        break;
      case '繁體中文':
        allQuestions = {
          '你後悔買過的東西是什麼？': 3,
          '你吃過最不同尋常或最需要勇氣的食物是什麼？': 3,
          '你嘗過寵物的食物嗎？': 4,
          '你會在洗澡時唱歌嗎？': 1,
          '你最喜歡在洗澡時哼唱什麼歌？': 2,
          '你收過最糟糕的禮物是什麼？': 2,
          '你最喜歡的電影是哪一部？': 2,
          '要是你一夜暴富，你最想做什麼？': 2,
          '如果神燈精靈讓你許三個願望，你會許什麼願望？': 1,
          '你為愛做過做瘋狂的事是什麼？': 3,
          '你有沒有暗戀過高中老師？': 4,
          '你曾經對伴侶或朋友撒過謊嗎？': 5,
          '仔細說說你第一次分手的故事。': 3,
          '你的初吻發生在幾歲？是和誰？': 4,
          '你有沒有試過在前任生日前跟對方分手，就為了避免給他們送生日禮物？': 4,
          '你會對公司同事有好感嗎？': 5,
          '你有沒有用過交友軟體？': 3,
          '你相信一見鍾情嗎？': 1,
          '所有玩家都要說出自己喜歡的明星藝人，否則就要接受1次懲罰。': 0,
          '如果你是個韓流歌手，你希望自己是誰？': 2,
          '1到10分，你覺得自己有多好看？': 4,
          '你最喜歡自己身體的哪個部位？': 4,
          '如果可以的話，你想改變身體哪個地方？': 5,
          '你會想要和哪個演員交換10天的壽命？': 1,
          '一年之中你最喜歡什麼時候？': 1,
          '你會允許我看你手機的流覽記錄嗎？': 5,
          '看到右邊的玩家時，你第一時間想到的是哪種動物？': 4,
          '1到10分，請為所有玩家的打扮風格進行打分。': 3,
          '你看過最羞於啟齒的節目是什麼？': 4,
          '請說出兩個你羞於啟齒但做了感覺很美好的癖好。': 3,
          '你在浴室待過最長的時間是什麼時候？為什麼？': 5,
          '你對父母隱瞞的最大的秘密是什麼？': 2,
          '你聽過最羞於啟齒的音樂是什麼？': 3,
          '你最遺憾的是什麼？': 3,
          '你覺得現場哪個玩家能在僵屍末日中生存下來？而哪個玩家會最先陣亡？': 2,
          '你的暗戀對像是誰？': 5,
          '到社交媒體上給你暗戀對象的近期照片點贊，否則就接受2次懲罰。': 0,
          '你曾用過什麼藉口來擺脫安排？（工作、約會等）': 3,
          '你的初吻感覺如何？': 4,
          '將你發送給好友或其它重要的人的最後一條簡訊大聲朗讀出來。': 5,
          '你撒過最大的謊是什麼？': 4,
          '你一天自拍幾次？': 4,
          '你最長多久沒洗澡？': 3,
          '如果要改名，你想改成什麼名字？': 1,
          '如果你能有超能力，那你想要有什麼樣的超能力？': 1,
          '你最害怕的是什麼？': 3,
          '你最常給誰發送簡訊？': 2,
          '你有沒有被炒過魷魚？': 4,
          '如果你餘生只能吃一種食物，你會選擇吃什麼？': 2,
          '你經歷過最痛的生理性疼痛是什麼？': 3,
          '你裸泳過嗎？': 4,
          '你最大的陋習是什麼？': 3,
          '你會一邊淋浴一邊尿尿嗎？': 5,
          '你對前任還有感覺嗎？': 5,
          '什麼歌會讓你聽了很感動？': 2,
          '如果你現在有1萬元，你會把錢花在什麼東西上？': 2,
          '你考試作過弊嗎？': 5,
          '如果你要去紋身，你想紋什麼？': 2,
          '是什麼會讓你感到自己備受寵愛？': 1,
          '說一首你K歌時必唱的歌曲。': 2,
          '你做過最冒險的事情是什麼？': 3,
          '你經歷過最幸運的事是什麼？': 2,
          '如果明天就要移民到其他國家，你想去哪個國家？': 1,
          '你相信靈魂伴侶嗎？': 2,
          '你有沒有將收到的禮物轉送給別人？那是什麼禮物？': 3,
          '你獨自一人的時候做過最奇怪的事情是什麼？': 4,
          '你私底下最喜歡怎樣的噁心食物組合？': 3,
          '別人給你取過最尷尬的綽號是什麼？': 4,
          '如果你能和某個人交換一天的人生，哪個人會是誰？': 2,
          '你最長多久不刷牙？': 3,
          '你相信有外星人嗎？': 1,
          '你有沒有給過別人假的電話號碼？': 2,
          '愛情和金錢，哪個對你來說最重要？': 4,
          '說出你最喜歡的玩家，否則接受2次懲罰。': 0,
          '你尿在自己身上過嗎？': 5,
          '最差勁的吻是和誰？': 4,
          '什麼時候喝得爛醉過？': 3,
          '如果你能變性一天，你想做什麼？': 2,
          '你最喜歡的家人是誰？': 3,
          '告訴我們你最尷尬的嘔吐經歷？': 4,
          '有沒有人不小心看到你沒穿衣服的樣子？': 5,
          '你有沒有試過一腳踏兩船？': 5,
          '你的車子有沒有不小心撞到人或東西？': 3,
          '你有沒有試過裝病不出席派對？': 2,
          '你有沒有任何迷信觀念？': 1,
          '你一周會穿同一條褲子幾次？': 3,
          '你有沒有在泳池裡撒過尿？': 5,
          '你在哪個應用程式上消耗最多時間？': 1,
          '謊報年齡的玩家，每個人都要接受1次懲罰。': 0,
          '你最討厭哪個家人？': 4,
          '曾對老闆撒謊的玩家，每個人都要接受1次懲罰。': 0,
          '描述你喝醉時做過最奇怪的事。': 3,
          '你手機裡有多少個修圖應用軟體？': 2,
          '接受1次懲罰。': 0,
          '是什麼會讓你每次都開懷大笑？': 1,
          '接受2次懲罰。': 0,
          '所有玩家接受1次懲罰。': 0,
          '什麼會讓你感到緊張？': 2,
          '講述你最感激的兩件事。': 2,
          '你的父母如何影響你決定自己的人生目標？': 1,
          '誰的淘寶購物車裡的東西最多，就要接受1次懲罰。': 0,
          '誰的手機使用時間最長，就要接受1次懲罰。': 0,
          '和一個陌生人自拍一張，否則接受2次懲罰。': 0,
          '你會和比你矮的人約會嗎？': 2,
          '你吻過多少人？': 3,
          '你打過架嗎？': 4,
          '你有沒有試過喝酒喝斷片？': 3,
          '誰是你的英雄？': 1,
          '你的夢想目的地是哪裡？': 1,
          '你睡覺時會流口水嗎？': 3,
          '你最喜歡的迪士尼角色是誰？': 2,
          '淘寶購物車裡東西最多的玩家要接受1次懲罰。': 0,
          '說出一個你嫉妒的人？': 5,
          '讓其他玩家在你的社交媒體上發佈動態。': 5,
          '展示手機裡最尷尬的照片，否則接受1次懲罰。': 0,
          '清空錢包並展示裡頭的東西，否則要接受1次懲罰。': 0,
        };
        break;
      default:
        allQuestions = {
          '你后悔买过什么东西？': 3,
          '你吃过最反常或最需要勇气的食物是什么？': 3,
          '你尝过宠物的食物吗？': 4,
          '你会在洗澡时唱歌吗？': 1,
          '你最喜欢在洗澡时哼唱什么歌？': 2,
          '你收过最糟糕的礼物是什么？': 2,
          '你最喜欢的电影是哪一部？': 2,
          '要是你一夜暴富，你想做的第一件事是什么？': 2,
          '如果神灯精灵让你许三个愿望，你会许什么愿望？': 1,
          '你为爱做过做疯狂的事是什么？': 3,
          '你有没有暗恋过高中老师？': 4,
          '你曾经对伴侣或朋友撒过谎吗？': 5,
          '仔细说说你第一次分手的故事。': 3,
          '你的初吻发生在几岁？和谁有了初吻？': 4,
          '你有没有试过在前任的生日前跟前任分手，就为了避免给他们送生日礼物？': 4,
          '你会对办公的同事有好感吗？': 5,
          '你有没有用过交友软件？': 3,
          '你相信一见钟情吗？': 1,
          '所有玩家都要说出自己喜欢的明星艺人，否则就要接受1次惩罚': 0,
          '如果你是个韩流歌手，那你会是谁？': 2,
          '1到10分，你觉得你的好看程度能得几分？': 4,
          '你最喜欢身体的哪个部位？': 4,
          '如果可以的话，你想改变身体的什么地方？': 5,
          '你会想要和哪个演员交换10天的寿命？': 1,
          '一年之中你最喜欢什么时候？': 1,
          '你会允许我看你手机的浏览记录吗？': 5,
          '看到右边的玩家时，你会第一时间想到哪种动物？': 4,
          '1到10分，请为所有玩家的打扮风格打分。': 3,
          '你看过最羞于启齿的节目是什么？': 4,
          '请说出两个你羞于启齿但做了感觉很美好的癖好。': 3,
          '你在浴室待最长时间是什么时候？为什么？': 5,
          '你对父母隐瞒的最大秘密是什么？': 2,
          '你听过最羞于启齿的音乐是什么？': 3,
          '你最遗憾的是什么？': 3,
          '你觉得现场哪个玩家能在僵尸末日中生存下来？而哪个玩家会最先阵亡？': 2,
          '你的暗恋对象是谁？': 5,
          '到社交媒体上给你暗恋对象的近期照片点赞，否则就接受2次惩罚': 0,
          '你曾用过什么借口来摆脱安排？（工作、约会等）': 3,
          '你的初吻感觉如何？': 4,
          '大声朗读你发送给好友或其它重要的人的最后一条信息': 5,
          '你撒过最大的谎是什么？': 4,
          '你一天自拍几次？': 4,
          '你最长多久没洗澡？': 3,
          '如果要改名，你想改成什么名字？': 1,
          '如果你能有超能力，那你想要有什么样的超能力？': 1,
          '你最害怕的是什么？': 3,
          '你最常给谁发送信息？': 2,
          '你有没有被炒过鱿鱼？': 4,
          '如果你余生只能吃一种食物，你会选择吃什么？': 2,
          '你经历过最痛的生理性疼痛是什么？': 3,
          '你裸泳过吗？': 4,
          '你最糟糕的习惯是什么？': 3,
          '你会在一边淋浴一边尿尿吗？': 5,
          '你对前任还有感觉吗？': 5,
          '什么歌会让你听了很感动？': 2,
          '如果你现在有1万元，你会把钱花在什么东西上？': 2,
          '你有没有在考试时作弊？': 5,
          '如果你要去纹身，你想纹什么？': 2,
          '是什么会让你感到自己备受宠爱？': 1,
          '说一首你K歌时必唱的歌曲.': 2,
          '你做过最冒险的事情是什么？': 3,
          '你经历过最幸运的事是什么？': 2,
          '如果明天就要移民到其他国家，你想到哪个国家？': 1,
          '你相信灵魂伴侣吗？': 2,
          '你有没有将收到的礼物转送给别人？那是什么礼物？': 3,
          '你独自一人的时候做过最奇怪的事情是什么？': 4,
          '你私底下最喜欢什么样的恶心食物组合？': 3,
          '你被人取过最尴尬的绰号是什么？': 4,
          '如果你能和某个人交换一天的人生，哪个人会是谁？': 2,
          '你最长多久不刷牙？': 3,
          '你相信有外星人吗？': 1,
          '你有没有给过别人假的电话号码？': 2,
          '爱情和金钱，哪个对你来说最重要？': 4,
          '说出你最喜欢的玩家，否则接受2次惩罚': 0,
          '你有没有试过失禁？': 5,
          '你接过最糟糕的吻是和谁？': 4,
          '你喝得最醉的时候是什么时候？': 3,
          '如果你能享受一天的变性效果，你想做什么？': 2,
          '你最喜欢的家人是谁？': 3,
          '告诉我们你最尴尬的呕吐经历？': 4,
          '有没有人不小心看到你的不穿衣服的模样？': 5,
          '你有没有试过一脚踏两船？': 5,
          '你的车子有没有不小心撞到人或东西？': 3,
          '你有没有试过装病来不出席派对？': 2,
          '你有没有任何迷信观念？': 1,
          '你一周会穿同一条裤子几次？': 3,
          '你试过在泳池里撒尿吗？': 5,
          '你在哪个应用程序上消耗最多时间？': 1,
          '谎报年龄的玩家，每个人都要接受1次惩罚。': 0,
          '你最讨厌哪个家人？': 4,
          '曾对老板撒谎的玩家，每个人都要接受1次惩罚。': 0,
          '描述你喝醉时做过最奇怪的事': 3,
          '你手机里有多少个修图应用程序？': 2,
          '接受1次惩罚': 0,
          '是什么会让你每次都开怀大笑？': 1,
          '接受2次惩罚': 0,
          '所有玩家接受1次惩罚': 0,
          '什么会让你感到紧张？': 2,
          '讲述你最感激的两件事。': 2,
          '你的父母如何影响你决定自己的人生目标？': 2,
          '谁的淘宝购物车里的东西最多，就要接受1次惩罚': 0,
          '谁的手机使用时间最长，就要接受1次惩罚': 0,
          '和一个陌生人自拍一张，否则接受2次惩罚': 0,
          '你会和比你矮的人约会吗？': 3,
          '你吻过多少人？': 4,
          '你打过架吗？': 3,
          '你有没有试过喝酒喝断片？': 1,
          '谁是你的英雄？': 1,
          '你的梦想目的地是哪里？': 3,
          '你睡觉时会流口水吗？': 2,
          '你最喜欢的迪斯尼角色是谁？': 1,
          '淘宝购物车里东西最多的玩家要接受1次惩罚': 0,
          '说出一个你嫉妒的人？': 5,
          '让其他玩家在你的社交媒体上发布动态': 1,
          '展示手机里最尴尬的照片，否则接受1次惩罚': 0,
          '清空钱包并展示里头的东西，否则要接受1次惩罚': 0,
        };
    }

    switch (widget.numberofplayers) {
      case 2:
        questionsPerPlayer = 30;
        break;
      case 3:
        questionsPerPlayer = 15;
        break;
      case 4:
        questionsPerPlayer = 10;
        break;
      case 5:
        questionsPerPlayer = 6;
        break;
      case 6:
        questionsPerPlayer = 5;
        break;
      default:
        questionsPerPlayer = 10;
    }

    setState(() {
      questionsAllowed = questionsPerPlayer * widget.numberofplayers!;
    });

    int totalQuestionsNeeded = questionsPerPlayer * widget.numberofplayers!;
    if (totalQuestionsNeeded > allQuestions!.length) {
      totalQuestionsNeeded = allQuestions!.length;
    }

    setState(() {
      List<String> questionList = allQuestions!.keys.toList();

      if (selectedDifficulty == 'Easy' ||
          selectedDifficulty == LanguageSim.easy ||
          selectedDifficulty == LanguageTrad.easy) {
        // Filter and sort questions for Easy difficulty (scores 0 to 2)
        questionList = questionList
            .where((q) => allQuestions![q]! >= 0 && allQuestions![q]! <= 2)
            .toList();
        // questionList
        //     .sort((a, b) => allQuestions![a]!.compareTo(allQuestions![b]!));
      } else if (selectedDifficulty == 'Hard' ||
          selectedDifficulty == LanguageSim.hard ||
          selectedDifficulty == LanguageTrad.hard) {
        // Filter and sort questions for Hard difficulty (scores 3 to 5)
        questionList = questionList
            .where((q) => allQuestions![q]! >= 3 && allQuestions![q]! <= 5)
            .toList();
        // questionList
        //     .sort((a, b) => allQuestions![b]!.compareTo(allQuestions![a]!));
      }

      List<String> shuffledQuestions = List.from(questionList);

      shuffledQuestions.shuffle();

      List<String> questions =
          shuffledQuestions.take(totalQuestionsNeeded).toList();

      this.questions = questions;
    });
  }

  int? questionScore;
  int currentPlayerIndex = 0;

  String? selectedLanguage;

  // @override
  // void initState() {
  //   super.initState();
  //   setupQuestions();
  //   selectedLanguage != null ? setupQuestions() : '';
  //   // Initialize player scores
  //   widget.players!.forEach((player) {
  //     playerScores[player] = 0;
  //   });
  // }

  void calculateScore(String playerName) {
    setState(() {
      int playerCurrentScore = playerScores[playerName] ??
          0; // If the player's score is null, it will default to 0

      String currentQuestion = questions.elementAt(currentQuestionIndex);
      int? allQuestionsScore = allQuestions![currentQuestion];

      // If the value from allQuestions map int is 0, set questionScore to 0
      print("QUESTION SCORE IS" + allQuestionsScore.toString());
      if (allQuestionsScore == 0) {
        setState(() {
          questionScore = 0;
        });
      } else {
        setState(() {
          questionScore = allQuestionsScore;
        });
      }
    });
  }

  void addPlayerScore(String playerName) {
    setState(() {
      int playerCurrentScore = playerScores[playerName] ??
          0; // If the player's score is null, it will default to 0

      String currentQuestion = questions.elementAt(currentQuestionIndex);
      int? allQuestionsScore = allQuestions![currentQuestion];

      // If the value from allQuestions map int is 0, set questionScore to 0
      print("QUESTION SCORE IS" + allQuestionsScore.toString());
      if (allQuestionsScore == 0) {
        setState(() {
          questionScore = 0;
        });
      } else {
        setState(() {
          questionScore = allQuestionsScore;
        });
      }

      playerScores[playerName] = playerCurrentScore + questionScore!;
      print(playerScores);
    });
  }

  void subPlayerScore(String playerName) {
    setState(() {
      int playerCurrentScore = playerScores[playerName] ??
          0; // If the player's score is null, it will default to 0

      String currentQuestion = questions.elementAt(currentQuestionIndex);
      int? allQuestionsScore = allQuestions![currentQuestion];

      // If the value from allQuestions map int is 0, set questionScore to 0
      print("QUESTION SCORE IS" + allQuestionsScore.toString());
      if (allQuestionsScore == 0) {
        setState(() {
          questionScore = 0;
        });
      } else {
        setState(() {
          questionScore = allQuestionsScore;
        });
      }

      playerScores[playerName] = playerCurrentScore - questionScore!;
      print(playerScores);
    });
  }

  // Function to show the scorecard in an AlertDialog
  void showScorecard(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                colors: [
                  Color.fromRGBO(243, 195, 255, 1),
                  Color.fromRGBO(255, 198, 222, 1),
                  Color.fromRGBO(255, 239, 180, 1),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            selectedLanguage == 'EN'
                                ? 'Scoreboard'
                                : selectedLanguage ==
                                        LanguageSim.chineseSimplified
                                    ? '记分牌' // replace with actual Chinese text
                                    : '記分牌',
                            style: GoogleFonts.kanit(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SizedBox(
                              width: 30,
                              child: Image.asset('assets/Vector1.png')),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: playerScores.entries.map((entry) {
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    // Initialize player scores
    widget.players!.forEach((player) {
      playerScores[player] = 0;
    });

    // Use async/await to wait for setupQuestions and then call calculateScore
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Call setupQuestions to initialize questions
    await setupQuestions();

    // Now that questions are initialized, you can call calculateScore
    calculateScore(widget.players![0]);
    addPlayerScore(
        widget.players![0]); // Replace 'playerName' with the actual player name
  }

  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // Fetch the name of the current player.
    String currentPlayerName =
        widget.players![currentPlayerIndex % widget.players!.length];

    return Scaffold(
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: SingleChildScrollView(
          child: Container(
            width: width, // Add width to the Container
            height: height, // Add height to the Container
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
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
                                        Center(
                                          child: Center(
                                            child: Text(
                                              selectedLanguage == 'EN'
                                                  ? 'DO YOU WANT TO LEAVE?'
                                                  : selectedLanguage ==
                                                          LanguageSim
                                                              .chineseSimplified
                                                      ? LanguageSim
                                                          .doYouWantToLeave // replace with actual Chinese text
                                                      : LanguageTrad
                                                          .doYouWantToLeave,
                                              style: GoogleFonts.kanit(
                                                fontSize: 32,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: width / 4,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: ((context) =>
                                                              LobbyScreen())));
                                                },
                                                child: Text(
                                                  selectedLanguage == 'EN'
                                                      ? 'Yes'
                                                      : selectedLanguage ==
                                                              LanguageSim
                                                                  .chineseSimplified
                                                          ? LanguageSim
                                                              .yes // replace with actual Chinese text
                                                          : LanguageTrad.yes,
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.pink,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: width / 4,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  selectedLanguage == 'EN'
                                                      ? 'No'
                                                      : selectedLanguage ==
                                                              LanguageSim
                                                                  .chineseSimplified
                                                          ? LanguageSim
                                                              .no // replace with actual Chinese text
                                                          : LanguageTrad.no,
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.blue,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                ),
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
                          },
                          child: Image.asset('assets/Group 20.png')),
                      Image.asset('assets/FAFA.png'),
                      // Icon(
                      //   Icons.menu,
                      //   size: 40,
                      //   color: Colors.white,
                      // ),
                      GestureDetector(
                          onTap: () {
                            showScorecard(context);
                          },
                          child: Image.asset('assets/solar_star-bold.png')),
                    ],
                  ),
                ),
                SizedBox(height: height / 20),
                SizedBox(
                    height: height / 8,
                    child: Center(child: Image.asset('assets/fafa_icn.png'))),
                SizedBox(height: height / 20),
                Center(
                  child: Text(currentPlayerName,
                      style: GoogleFonts.kalam(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SizedBox(height: height / 40),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    width: width,
                    height: height / 6,
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
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(questions[currentQuestionIndex],
                            style: GoogleFonts.kanit(
                              fontSize: selectedLanguage == 'EN'
                                  ? 24
                                  : 28, // Adjust the font size for Chinese
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height / 15),
                questionScore == 0
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: GestureDetector(
                              onTap: () {
                                if (currentQuestionIndex <
                                    (widget.players!.length *
                                            questionsPerPlayer) -
                                        1) {
                                  print(currentQuestionIndex);
                                  print(widget.players!.length *
                                      questionsPerPlayer);
                                  currentQuestionIndex++;
                                  currentPlayerIndex++;
                                  setState(() {
                                    calculateScore(widget.players![
                                        currentPlayerIndex %
                                            widget.players!.length]);
                                    addPlayerScore(widget.players![
                                        currentPlayerIndex %
                                            widget.players!.length]);

                                    totalScore++; // Increment the total score each time a question is answered.
                                    if (currentQuestionIndex >=
                                        questions.length) {
                                      currentQuestionIndex = 0;
                                    }
                                  });
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => LeaderBoard(
                                                playerScores: playerScores,
                                                totalScore: totalScore,
                                              ))));
                                }
                              },
                              child: Container(
                                width: width,
                                height: height / 10,
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
                                child: Center(
                                  child: Text(
                                      selectedLanguage == 'EN'
                                          ? 'Next'
                                          : selectedLanguage ==
                                                  LanguageSim.chineseSimplified
                                              ? LanguageSim
                                                  .next // replace with actual Chinese text
                                              : LanguageTrad.next,
                                      style: GoogleFonts.kanit(
                                        fontSize: 32,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: GestureDetector(
                              onTap: () {
                                if (currentQuestionIndex <
                                    (widget.players!.length *
                                            questionsPerPlayer) -
                                        1) {
                                  print(currentQuestionIndex);
                                  print(widget.players!.length *
                                      questionsPerPlayer);
                                  currentQuestionIndex++;
                                  currentPlayerIndex++;
                                  setState(() {
                                    calculateScore(widget.players![
                                        currentPlayerIndex %
                                            widget.players!.length]);
                                    addPlayerScore(widget.players![
                                        currentPlayerIndex %
                                            widget.players!.length]);

                                    totalScore++; // Increment the total score each time a question is answered.
                                    if (currentQuestionIndex >=
                                        questions.length) {
                                      currentQuestionIndex = 0;
                                    }
                                  });
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => LeaderBoard(
                                                playerScores: playerScores,
                                                totalScore: totalScore,
                                              ))));
                                }
                              },
                              child: Container(
                                width: width,
                                height: height / 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromRGBO(173, 223, 146, 1),
                                ),
                                child: Center(
                                  child: questionScore == 1
                                      ? Text(
                                          selectedLanguage == 'EN'
                                              ? 'ANSWER ($questionScore POINT)'
                                              : selectedLanguage ==
                                                      LanguageSim
                                                          .chineseSimplified
                                                  ? '回答 ($questionScore 分)' // replace with actual Chinese text
                                                  : '回答 ($questionScore 分)',
                                          style: GoogleFonts.kanit(
                                            fontSize: 32,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      : Text(
                                          selectedLanguage == 'EN'
                                              ? 'ANSWER ($questionScore POINTS)'
                                              : selectedLanguage ==
                                                      LanguageSim
                                                          .chineseSimplified
                                                  ? '回答 ($questionScore 分)' // replace with actual Chinese text
                                                  : '回答 ($questionScore 分)',
                                          style: GoogleFonts.kanit(
                                            fontSize: 32,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  subPlayerScore(widget.players![
                                      currentPlayerIndex %
                                          widget.players!.length]);
                                  currentQuestionIndex++;
                                  currentPlayerIndex++;
                                  addPlayerScore(widget.players![
                                      currentPlayerIndex %
                                          widget.players!.length]);
                                });
                              },
                              child: Container(
                                width: width,
                                height: height / 10,
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
                                child: Center(
                                  child: Text(
                                      selectedLanguage == 'EN'
                                          ? '1 PUNISHMENT'
                                          : selectedLanguage ==
                                                  LanguageSim.chineseSimplified
                                              ? '1 次懲罰' // replace with actual Chinese text
                                              : '1 次懲罰',
                                      style: GoogleFonts.kanit(
                                        fontSize: 32,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      )),
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
      ),
    );
  }
}
