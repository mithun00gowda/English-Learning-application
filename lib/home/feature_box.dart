import 'package:friend/home/pallete.dart';
import 'package:flutter/material.dart';

class FeatureBox extends StatelessWidget {
  final Color color;
  final String headerText;
  final String descriptionText;
  final Widget destinationPage;

  const FeatureBox({
    Key? key,
    required this.color,
    required this.headerText,
    required this.descriptionText,
    required this.destinationPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Wrap the FeatureBox contents with GestureDetector
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => destinationPage), // Navigate to ChatPage
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 35,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0).copyWith(
            left: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  headerText,
                  textAlign: TextAlign.center, // Added textAlign property
                  style: const TextStyle(
                    fontFamily: 'Cera Pro',
                    color: Pallete.blackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  descriptionText,
                  style: const TextStyle(
                    fontFamily: 'Cera Pro',
                    color: Pallete.blackColor,
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
