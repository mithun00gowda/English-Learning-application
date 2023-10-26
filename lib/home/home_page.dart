import 'package:firebase_auth/firebase_auth.dart';
import 'package:friend/home/feature_box.dart';
import 'package:friend/home/pallete.dart';
import 'package:flutter/material.dart';
import 'package:friend/home/profile_page.dart';
import 'package:friend/home/dashboard_page.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'assistant_page.dart';
import 'package:friend/home/chat_page.dart';
import '../quiz/quiz.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final speechToText = SpeechToText();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String lastWords = '';

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  void dashboard() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DashboardPage()),
    );
  }

  void navigateToProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              const ProfilePage()), // Navigate to the profile page
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(
          'Amigo',
          style: TextStyle(
            fontFamily: 'Cera Pro',
            fontSize: 25,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer(); // Open the side menu
          },
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Pallete.firstSuggestionBoxColor,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DrawerHeader(
                      child: Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 64,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Text('Dashboard'),
              leading: const Icon(Icons.dashboard),
              onTap: dashboard,
            ),
            ListTile(
              title: const Text('Profile'),
              leading: const Icon(Icons.person),
              onTap: navigateToProfile,
            ),
            ListTile(
              title: const Text('Sign Out'),
              leading: const Icon(Icons.exit_to_app),
              onTap: signOut,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Virtual assistent picture
            Stack(
              children: [
                Center(
                  child: Container(
                    height: 120,
                    width: 120,
                    margin: const EdgeInsets.only(top: 4),
                    decoration: const BoxDecoration(
                      color: Pallete.assistantCircleColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Container(
                  height: 123,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                        'assets/images/vf2.png',
                      ))),
                ),
              ],
            ),
            //chat bubble
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(
                top: 30,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Pallete.borderColor,
                  ),
                  borderRadius: BorderRadius.circular(20).copyWith(
                    topLeft: Radius.zero,
                  )),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Good To See U Amigo',
                  style: TextStyle(
                    fontFamily: 'Cera Pro',
                    color: Pallete.mainFontColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 10, left: 22),
              child: const Text(
                'What Should You Learn Today',
                style: TextStyle(
                  fontFamily: 'Cera Pro',
                  color: Pallete.mainFontColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //features list
            const Column(
              children: [
                FeatureBox(
                  color: Pallete.firstSuggestionBoxColor,
                  headerText: 'Chat Learn',
                  descriptionText: 'Learn English By Chat With your AI Friend',
                  destinationPage: ChatPage(),
                ),
                FeatureBox(
                  color: Pallete.secondSuggestionBoxColor,
                  headerText: 'Quiz',
                  descriptionText: 'Learn English By Quiz With your AI Friend',
                  destinationPage: quiz(),
                ),
                FeatureBox(
                  color: Pallete.firstSuggestionBoxColor,
                  headerText: 'Smart Voice Friend',
                  descriptionText: 'Learn English By Speak With your AI Friend',
                  destinationPage: AssistantPage(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
