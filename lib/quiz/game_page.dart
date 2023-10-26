import 'package:flutter/material.dart';
import 'package:friend/home/home_page.dart';
import 'package:friend/home/pallete.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  void navigateToGame() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.6,
                decoration: const BoxDecoration(
                  color: Pallete.firstSuggestionBoxColor,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.6,
                decoration: const BoxDecoration(
                  color: Pallete.secondSuggestionBoxColor,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(70)),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  padding: const EdgeInsets.only(top: 40),
                  decoration: const BoxDecoration(
                    color: Pallete.firstSuggestionBoxColor,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(70)),
                  ),
                  child: const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                        fontFamily: 'Cera Pro',
                        color: Pallete.whiteColor,
                        fontSize: 70,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        wordSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height /
                      1.8, // Adjust the height
                  decoration: const BoxDecoration(
                    color: Pallete.secondSuggestionBoxColor,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height /
                      2.0, // Adjust the height
                  padding: const EdgeInsets.only(top: 40, bottom: 30),
                  decoration: const BoxDecoration(
                    color: Pallete.firstSuggestionBoxColor,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(70)),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Learning is Everything',
                        style: TextStyle(
                          fontFamily: 'Cera Pro',
                          color: Pallete.borderColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          wordSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          "Learning with Pleaser with Dear Learner, Wherever you are.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            color: Pallete.blackColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),
                      SingleChildScrollView(
                        child: Material(
                          color: Pallete.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: navigateToGame,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 80),
                              child: const Text(
                                "Get Started",
                                style: TextStyle(
                                  color: Pallete.blackColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
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
