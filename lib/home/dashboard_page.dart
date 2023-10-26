import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Quiz Scores',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ScoreCard(
              quizName: 'Quiz 1',
              score: 20, // Dummy score
            ),
            ScoreCard(
              quizName: 'Quiz 2',
              score: 15, // Dummy score
            ),
            // Add more ScoreCard widgets for other quizzes
          ],
        ),
      ),
    );
  }
}

class ScoreCard extends StatelessWidget {
  final String quizName;
  final int score;

  ScoreCard({required this.quizName, required this.score});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              quizName,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Score: $score',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
