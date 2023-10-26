// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _controller = TextEditingController();
  List<String> _messages = [];

  Map<String, String> _teachingResponses = {
    "hi": "Hello! How can I assist you with English today?",
    "hello": "Hello! Welcome to English learning. How can I help you?",
    "how are you":
        "I'm just a bot, but thanks for asking! How can I assist you?",
    "what's up":
        "Not much, just here to help you learn English. What do you need?",
    "verb":
        "Verbs are action words. They describe actions. For example, 'run' and 'eat' are verbs.",
    "noun":
        "A noun is a word for a person, place, thing, or idea. 'Cat' and 'house' are nouns.",
    "adjective":
        "Adjectives describe nouns. They tell us more about things. 'Beautiful' is an adjective.",
    "phrase":
        "A phrase is a group of words that work together. For example, 'in the park' is a phrase.",
    "sentence":
        "A sentence is a group of words that makes sense. It has a subject and a verb.",
    "grammar":
        "Grammar is the rules for how we speak and write. It helps us communicate correctly.",
    "pronoun": "Pronouns replace nouns. 'He,' 'she,' and 'it' are pronouns.",
    "vocabulary":
        "Vocabulary is the words we know and use. Learning new words is important.",
    "practice":
        "Practice makes perfect! Regular practice helps improve your English skills.",
    "common mistakes":
        "We all make mistakes. Learning from them is part of the learning process.",
    "improve speaking":
        "To improve speaking, practice speaking English every day and try to have conversations.",
    "learning tips":
        "Here's a tip: read English books, watch English movies, and talk to native speakers.",
    "study materials":
        "There are many books and online resources available for learning English. Find what works for you.",
    "fun with English":
        "Learning English can be fun! Try playing word games or solving puzzles in English.",
    "ask questions":
        "Don't hesitate to ask questions. I'm here to help you understand English better."

    // Add more teaching responses here.
  };

  void _sendMessage() {
    setState(() {
      String userMessage = _controller.text;
      _messages.add("You: $userMessage");

      // Check if the user's message matches any teaching responses.
      String botResponse = _getBotResponse(userMessage.toLowerCase());

      // If there's no specific response, provide a default message.
      if (botResponse.isEmpty) {
        botResponse = "I'm here to help you learn English. Ask me anything!";
      }

      _messages.add("Bot: $botResponse");

      _controller.clear();
    });
  }

  String _getBotResponse(String userMessage) {
    // Check if the user's message matches any predefined responses.
    for (var keyword in _teachingResponses.keys) {
      if (userMessage.contains(keyword)) {
        return _teachingResponses[keyword]!;
      }
    }

    // If no predefined response matches, you can implement more advanced NLP here.
    // For simplicity, return an empty string as a default response.
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('English Teaching Bot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
