// In third_hero.dart

import 'package:flutter/material.dart';
import 'feature_card.dart';


class ThirdHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth < 800;

    return Container(
      padding: isMediumScreen 
          ? const EdgeInsets.all(30.0)
          : const EdgeInsets.only(top: 24.0, bottom: 24, left: 170, right: 170),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(99, 44, 7, 43),
              Color.fromARGB(56, 20, 65, 78),
              Color.fromARGB(56, 38, 20, 78),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            FeatureCard(
              title: "Online IDE Built for Education",
              description: "Write, run, & debug code in any web browser, no account or downloads needed.",
              buttonText: "Start Coding",
              buttonColor: Colors.greenAccent,
              imagePath: 'assets/carbon.png',
              isSmallScreen: isSmallScreen,
              imageOnLeft: false,
              ),

            SizedBox(height: 40),
            FeatureCard(
              title: "Learning Management System",
              description: "Seamlessly manage rosters, lessons, assignments, progress, and grades for any type of classroom.",
              buttonText: "Learn More",
              buttonColor: Colors.greenAccent,
              imagePath: 'assets/carbon.png',
              isSmallScreen: isSmallScreen,
              imageOnLeft: true,
            ),
          ],
        ),
      ),
    );
  }
}
