import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:friend/home/pallete.dart';
import 'package:friend/quiz/quiz_page.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  String _selectedMode = 'Easy';
  List<String> _categories = [];

  get selectedCategory => 'easy'; // List to store the categories

  @override
  void initState() {
    super.initState();
    _loadCategories(); // Load the categories from Firestore when the widget initializes
  }

  Future<void> _loadCategories() async {
    final snapshot = await FirebaseFirestore.instance
        .collection(
            'categories') // Replace 'categories' with your Firestore collection name
        .get();

    final categories =
        List<String>.from(snapshot.docs.map((doc) => doc.get('name')));
    setState(() {
      _categories = categories;
      _selectedMode = categories
          .first; // Set the default selected mode to the first category
    });
  }

  void navigateToQuizPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizGamePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Pallete.firstSuggestionBoxColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quiz',
          style: TextStyle(
            color: Pallete.blackColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        backgroundColor: Pallete.firstSuggestionBoxColor,
        centerTitle: true,
      ),
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Select Game Mode',
            style: TextStyle(fontSize: 35, fontFamily: 'Cera Pro'),
          ),
          const SizedBox(height: 40),
          DropdownButton<String>(
            value: _selectedMode,
            onChanged: (String? newValue) {
              setState(() {
                _selectedMode = newValue!;
              });
            },
            items: _categories.map((category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Container(
                  width: 150, // Adjust the width of the DropdownMenuItem
                  child: Text(
                    category,
                    style: TextStyle(fontSize: 20), // Adjust the font size
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 32),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: navigateToQuizPage,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Pallete.secondSuggestionBoxColor, // Set background color
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                child: const Text(
                  "Start",
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
        ],
      ),
    );
  }
}
