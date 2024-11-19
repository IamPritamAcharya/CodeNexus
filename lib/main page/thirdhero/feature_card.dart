import 'package:flutter/material.dart';
import 'feature_image.dart';
import 'feature_title.dart';
import 'feature_description.dart';
import 'feature_button.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final Color buttonColor;
  final String imagePath;
  final bool isSmallScreen;
  final bool imageOnLeft; // New property to control image position

  const FeatureCard({
    required this.title,
    required this.description,
    required this.buttonText,
    required this.buttonColor,
    required this.imagePath,
    required this.isSmallScreen,
    required this.imageOnLeft, // Initialize imageOnLeft
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: isSmallScreen
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FeatureTitle(title: title),
                SizedBox(height: 12),
                FeatureDescription(description: description),
                SizedBox(height: 20),
                FeatureButton(
                  buttonText: buttonText,
                  buttonColor: buttonColor,
                  onPressed: () {},
                ),
                SizedBox(height: 20),
                FeatureImage(imagePath: imagePath),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: imageOnLeft
                  ? _buildContentWithImageLeft()
                  : _buildContentWithImageRight(),
            ),
    );
  }

  List<Widget> _buildContentWithImageLeft() {
    return [
      Expanded(
        child: FeatureImage(imagePath: imagePath),
        
      ),
      SizedBox(width: 50),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FeatureTitle(title: title),
            SizedBox(height: 12),
            FeatureDescription(description: description),
            SizedBox(height: 20),
            FeatureButton(
              buttonText: buttonText,
              buttonColor: buttonColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> _buildContentWithImageRight() {
    return [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FeatureTitle(title: title),
            SizedBox(height: 12),
            FeatureDescription(description: description),
            SizedBox(height: 20),
            FeatureButton(
              buttonText: buttonText,
              buttonColor: buttonColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
      SizedBox(width: 20),
      Expanded(
        child: FeatureImage(imagePath: imagePath),
      ),
    ];
  }
}
