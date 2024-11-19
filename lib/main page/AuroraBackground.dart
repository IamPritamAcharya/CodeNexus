import 'package:flutter/material.dart';

class AuroraBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Dynamically adjust the number of images for smaller devices
    final isSmallScreen = size.height <= 600;

    // Predefined transparency values
    final List<double> opacities = [0.5, 0.1, 0.3, 0.2, 0.4];

    // Aurora images data (path, width, height, position)
    final auroraImages = [
      {'path': 'assets/pink.png', 'width': 1000.0, 'height': 800.0, 'top': -100.0, 'left': -50.0},
      {'path': 'assets/teal.png', 'width': 1500.0, 'height': 1500.0, 'top': -200.0, 'left': -750.0},
      {'path': 'assets/red.png', 'width': 350.0, 'height': 350.0, 'bottom': -150.0, 'right': -100.0},
      {'path': 'assets/red.png', 'width': 800.0, 'height': 800.0, 'bottom': -500.0, 'left': 50.0},
      {'path': 'assets/teal.png', 'width': 500.0, 'height': 400.0, 'top': -90.0, 'right': -200.0},
    ];

    // Limit images if on a smaller screen
    final displayedImages = isSmallScreen ? auroraImages.take(3).toList() : auroraImages;

    // Calculate a size scaling factor based on the screen size
    double scaleFactor = isSmallScreen ? 0.6 : 1.0;

    return Stack(
      children: [
        // Main background color
        Container(color: Colors.black),

        // Aurora layers with predefined transparency and scaling
        for (int i = 0; i < displayedImages.length; i++)
          _buildAuroraImage(displayedImages[i], opacities[i], scaleFactor),
      ],
    );
  }

  Widget _buildAuroraImage(Map<String, dynamic> imageData, double opacity, double scaleFactor) {
    return Positioned(
      top: imageData['top'],
      left: imageData['left'],
      bottom: imageData['bottom'],
      right: imageData['right'],
      child: Opacity(
        opacity: opacity,
        child: Image.asset(
          imageData['path'],
          width: imageData['width'] * scaleFactor,  // Scale the width
          height: imageData['height'] * scaleFactor,  // Scale the height
          fit: BoxFit.contain, // Ensure the image is fully visible
        ),
      ),
    );
  }
}
