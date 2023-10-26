import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class AssistantPage extends StatefulWidget {
  const AssistantPage({Key? key}) : super(key: key);

  @override
  _AssistantPageState createState() => _AssistantPageState();
}

class _AssistantPageState extends State<AssistantPage> {
  stt.SpeechToText _speechToText = stt.SpeechToText();
  String _recognizedSpeech = '';

  void _startListening() async {
    if (!_speechToText.isAvailable) {
      print('Speech recognition not available');
      return;
    }

    if (!_speechToText.isListening) {
      bool res = await _speechToText.listen(
        onResult: (result) {
          setState(() {
            _recognizedSpeech = result.recognizedWords;
          });
        },
      );

      if (res) {
        print('Listening started');
      } else {
        print('Failed to start listening');
      }
    } else {
      _speechToText.stop();
      print('Listening stopped');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assistant Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/vf2.png'),
            ),
            const SizedBox(height: 16),
            Text(
              'Result:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              _recognizedSpeech,
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startListening,
        child: Icon(_speechToText.isListening ? Icons.mic_off : Icons.mic),
      ),
    );
  }
}
