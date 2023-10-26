import 'package:http/http.dart' as http;
import 'dart:convert';

import '../quiz/quiz_page.dart';

class DBconnect {
  final url = Uri.parse(
      'https://amigo-390705-default-rtdb.firebaseio.com/questions.json');
  Future<void> addQuestion(Question question) async {
    http.post(url,
        body: json.encode({
          'question': question.questionText,
          'options': question.options,
        }));
  }

  Future<void> featQuestions() async {
    http.get(url).then((response) {
      var data = json.decode(response.body);
      print(data);
    });
  }
}
