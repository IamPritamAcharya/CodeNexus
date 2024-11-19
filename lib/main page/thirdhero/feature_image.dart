import 'package:flutter/material.dart';

class FeatureImage extends StatelessWidget {
  final String imagePath;

  const FeatureImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[800],
      ),
      padding: const EdgeInsets.all(12.0),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
