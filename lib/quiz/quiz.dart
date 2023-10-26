import 'package:flutter/material.dart';
import 'package:friend/home/pallete.dart';
import '../quiz/question_model.dart';
import '../quiz/question_widget.dart';
import '../quiz/next_button.dart';
import '../quiz/option_card.dart';
import '../quiz/result_box.dart';

class quiz extends StatefulWidget {
  const quiz({super.key});

  @override
  State<quiz> createState() => _quizState();
}

class _quizState extends State<quiz> {
  List<Question> _questions = [
    Question(
      id: "10",
      title: 'A for what ____',
      options: {'Apple': true, 'Ball': false, 'cat': false, 'Dog': false},
    ),
    Question(
      id: "11",
      title: 'B for what ____',
      options: {'Apple': false, 'Ball': true, 'cat': false, 'Dog': false},
    ),
    Question(
      id: "12",
      title: 'C for what ____',
      options: {'Apple': false, 'Ball': false, 'cat': true, 'Dog': false},
    ),
    Question(
      id: "13",
      title: 'D for what ____',
      options: {'Apple': false, 'Ball': false, 'cat': false, 'Dog': true},
    ),
    Question(
      id: "14",
      title: 'E for what ____',
      options: {'Apple': false, 'Ball': false, 'cat': false, 'Elephant': true},
    ),
    Question(
      id: "15",
      title: 'F for what ____',
      options: {'Apple': false, 'Ball': false, 'cat': false, 'Fog': true},
    ),
    Question(
      id: "16",
      title: 'G for what ____',
      options: {'Apple': false, 'Ball': false, 'cat': false, 'Ghot': true},
    ),
    Question(
      id: "17",
      title: 'H for what ____',
      options: {'House': true, 'Hat': false, 'Horse': false, 'Hammer': false},
    ),
    Question(
      id: "18",
      title: 'I for what ____',
      options: {
        'Apple': false,
        'Ball': false,
        'Ice Cream': true,
        'Insect': false
      },
    ),
    Question(
      id: "19",
      title: 'J for what ____',
      options: {'Jar': true, 'Book': false, 'Cat': false, 'Jump': false},
    ),
    Question(
      id: "20",
      title: 'K for what ____',
      options: {'Key': true, 'Tree': false, 'Sun': false, 'Kite': false},
    ),
    Question(
      id: "21",
      title: 'L for what ____',
      options: {'Lion': true, 'Car': false, 'Dog': false, 'Leaf': false},
    ),
    Question(
      id: "22",
      title: 'M for what ____',
      options: {'Moon': true, 'Table': false, 'Fish': false, 'Ball': false},
    ),
    Question(
      id: "23",
      title: 'N for what ____',
      options: {'Nest': true, 'Chair': false, 'House': false, 'Box': false},
    ),
    Question(
      id: "24",
      title: 'O for what ____',
      options: {
        'Orange': true,
        'Carrot': false,
        'Pencil': false,
        'Guitar': false
      },
    ),
    Question(
      id: "25",
      title: 'P for what ____',
      options: {'Pencil': true, 'Fish': false, 'Apple': false, 'Banana': false},
    ),
    Question(
      id: "26",
      title: 'Q for what ____',
      options: {'Queen': true, 'Car': false, 'House': false, 'Dog': false},
    ),
    Question(
      id: "27",
      title: 'R for what ____',
      options: {'Rainbow': true, 'Tree': false, 'Book': false, 'Car': false},
    ),
    Question(
      id: "28",
      title: 'S for what ____',
      options: {'Sun': true, 'Moon': false, 'Star': false, 'Cloud': false},
    ),
    Question(
      id: "29",
      title: 'T for what ____',
      options: {'Tree': true, 'Car': false, 'Fish': false, 'House': false},
    ),
    Question(
      id: "30",
      title: 'U for what ____',
      options: {'Umbrella': true, 'Shoe': false, 'Table': false, 'Ball': false},
    ),
    Question(
      id: "31",
      title: 'V for what ____',
      options: {'Violin': true, 'Banana': false, 'Book': false, 'Dog': false},
    ),
    Question(
      id: "32",
      title: 'W for what ____',
      options: {'Wagon': true, 'Carrot': false, 'Fish': false, 'Leaf': false},
    ),
    Question(
      id: "33",
      title: 'X for what ____',
      options: {'Xylophone': true, 'Moon': false, 'Apple': false, 'Dog': false},
    ),
    Question(
      id: "34",
      title: 'Y for what ____',
      options: {'Yacht': true, 'Tree': false, 'Car': false, 'Ball': false},
    ),
    Question(
      id: "35",
      title: 'Z for what ____',
      options: {'Zebra': true, 'Sun': false, 'House': false, 'Leaf': false},
    ),
  ];

  //create  an index to loop through _questions

  int index = 0;

// create a score veriable
  int score = 0;

  // create a boolean value to check if the user has clicked
  bool isPressed = false;
  // create a function to display the next question
  bool isAlreadySelected = false;

  void nextQuestion() {
    if (index == _questions.length - 1) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => ResultBox(
                result: score, //total number of the user got
                questionLength: _questions.length,
                onPressed: startOver,
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++; //when the index will change to 1 rebuild the app.
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please select any option'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
      }
    }
  }

  //create a function to changing the color
  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  // ctreate a function to start over
  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.assistantCircleColor,
      appBar: AppBar(
        title: const Text('Quiz'),
        backgroundColor: Pallete.assistantCircleColor,
        shadowColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Score: $score',
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            //add the questionwidget here
            QuestionWidget(
              question: _questions[index]
                  .title, //means the frist question in the list
              indexAction: index, //curently at 0
              totalQuestions: _questions.length, //total length of the list
            ),
            const Divider(
              color: Pallete.blackColor,
            ),
            const SizedBox(height: 25.0),
            for (int i = 0; i < _questions[index].options.length; i++)
              GestureDetector(
                onTap: () => checkAnswerAndUpdate(
                    _questions[index].options.values.toList()[i] == true),
                child: OptionCard(
                  option: _questions[index].options.keys.toList()[i],
                  color: isPressed
                      ? _questions[index].options.values.toList()[i] == true
                          ? Pallete.correct
                          : Pallete.incorrect
                      : Pallete.whiteColor,
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
