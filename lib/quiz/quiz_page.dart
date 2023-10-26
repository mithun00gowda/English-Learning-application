import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuizGamePage extends StatefulWidget {
  const QuizGamePage({Key? key}) : super(key: key);

  @override
  _QuizGamePageState createState() => _QuizGamePageState();
}

class _QuizGamePageState extends State<QuizGamePage> {
  final url = Uri.parse(
      'https://amigo-390705-default-rtdb.firebaseio.com/questions.json');
  List<Question> questions = [];
  int currentQuestionIndex = 0;
  int score = 0;
  bool showResult = false;

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  Future<List<Question>> fetchQuestions() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data != null) {
          List<Question> questions = [];
          data.forEach((key, value) {
            final questionText = value['question'];
            final options = List<String>.from(value['options']);
            final correctAnswerIndex = value['correctAnswer'];
            questions.add(
              Question(
                questionText: questionText,
                options: options,
                correctAnswerIndex: correctAnswerIndex,
              ),
            );
          });
          return questions;
        } else {
          print('No questions found.');
        }
      } else {
        print('Failed to fetch questions. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching questions: $e');
    }
    return [];
  }

  void answerQuestion(int selectedOptionIndex) {
    final currentQuestion = questions[currentQuestionIndex];
    if (selectedOptionIndex == currentQuestion.correctAnswerIndex) {
      setState(() {
        score++;
      });
    }
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      setState(() {
        showResult = true;
      });
    }
  }

  void restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      showResult = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Game'),
      ),
      body: Center(
        child: showResult
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Quiz Result',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Score: $score/${questions.length}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: restartQuiz,
                    child: const Text('Restart Quiz'),
                  ),
                ],
              )
            : questions.isEmpty
                ? const CircularProgressIndicator() // Show loading indicator while fetching data
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Question ${currentQuestionIndex + 1}/${questions.length}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        questions[currentQuestionIndex].questionText,
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ...questions[currentQuestionIndex].options.map((option) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ElevatedButton(
                            onPressed: () => answerQuestion(
                                questions[currentQuestionIndex]
                                    .options
                                    .indexOf(option)),
                            child: Text(option),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
      ),
    );
  }
}

class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      questionText: json['question'],
      options: List<String>.from(json['options']),
      correctAnswerIndex: json['correctAnswer'],
    );
  }
}
