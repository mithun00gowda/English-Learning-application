// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import '../home/pallete.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({
    Key? key,
    required this.result,
    required this.questionLength,
    required this.onPressed,
  }) : super(key: key);

  final int result;
  final int questionLength;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Pallete.assistantCircleColor,
      content: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Result',
                style: TextStyle(
                    color: Pallete.blackColor,
                    fontSize: 22.0,
                    fontFamily: 'Cera Pro'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              CircleAvatar(
                radius: 70.0,
                child: Text(
                  '$result/$questionLength',
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Cera Pro',
                  ),
                ),
                backgroundColor: result == questionLength / 2
                    ? Colors.yellow
                    : result < questionLength / 2
                        ? Pallete.incorrect
                        : Pallete.correct,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                result == questionLength / 2
                    ? 'Almost There'
                    : result < questionLength / 2
                        ? 'Try Again ?'
                        : 'Great!',
                style: const TextStyle(
                  color: Pallete.borderColor,
                  fontFamily: 'Cera Pro',
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              GestureDetector(
                onTap: onPressed,
                child: const Text(
                  'Start Over',
                  style: TextStyle(
                    color: Color.fromARGB(255, 3, 33, 84),
                    fontSize: 20.0,
                    letterSpacing: 1.0,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
