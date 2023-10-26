import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class AddQuestionPage extends StatefulWidget {
  const AddQuestionPage({Key? key}) : super(key: key);

  @override
  _AddQuestionPageState createState() => _AddQuestionPageState();
}

class _AddQuestionPageState extends State<AddQuestionPage> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _option1Controller = TextEditingController();
  final TextEditingController _option2Controller = TextEditingController();
  final TextEditingController _option3Controller = TextEditingController();
  final TextEditingController _option4Controller = TextEditingController();
  final TextEditingController _correctAnswerController =
      TextEditingController();
  String _selectedCategory = 'Easy'; // Default category is 'Easy'

  void _addQuestionToDatabase() {
    final DatabaseReference questionRef =
        // ignore: deprecated_member_use
        FirebaseDatabase.instance.reference().child('questions');

    final newQuestion = {
      'question': _questionController.text,
      'options': [
        _option1Controller.text,
        _option2Controller.text,
        _option3Controller.text,
        _option4Controller.text,
      ],
      'correctAnswer': _correctAnswerController.text,
      'category': _selectedCategory,
    };

    questionRef.push().set(newQuestion).then((value) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Question Added'),
            content: const Text('The question has been added successfully.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _resetFormFields();
                },
              ),
            ],
          );
        },
      );
    }).catchError((error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('An error occurred: $error'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    });
  }

  void _resetFormFields() {
    _questionController.clear();
    _option1Controller.clear();
    _option2Controller.clear();
    _option3Controller.clear();
    _option4Controller.clear();
    _correctAnswerController.clear();
    _selectedCategory = 'Easy';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Question'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _questionController,
                decoration: const InputDecoration(
                  labelText: 'Question',
                ),
              ),
              const SizedBox(height: 16),
              Text('Options:'),
              TextFormField(
                controller: _option1Controller,
                decoration: const InputDecoration(
                  labelText: 'Option 1',
                ),
              ),
              TextFormField(
                controller: _option2Controller,
                decoration: const InputDecoration(
                  labelText: 'Option 2',
                ),
              ),
              TextFormField(
                controller: _option3Controller,
                decoration: const InputDecoration(
                  labelText: 'Option 3',
                ),
              ),
              TextFormField(
                controller: _option4Controller,
                decoration: const InputDecoration(
                  labelText: 'Option 4',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _correctAnswerController,
                decoration: const InputDecoration(
                  labelText: 'Correct Answer',
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                onChanged: (newValue) {
                  setState(() {
                    _selectedCategory = newValue!;
                  });
                },
                items: ['Easy', 'Medium', 'Hard']
                    .map((category) => DropdownMenuItem<String>(
                          value: category,
                          child: Text(category),
                        ))
                    .toList(),
                decoration: const InputDecoration(
                  labelText: 'Category',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _addQuestionToDatabase,
                child: const Text('Add Question'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
