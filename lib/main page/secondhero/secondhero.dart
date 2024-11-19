// File: hero/second_hero.dart
import 'package:comp/main%20page/secondhero/SecondHeroSubtitle.dart';
import 'package:comp/main%20page/secondhero/SecondHeroTitle.dart';
import 'package:comp/main%20page/secondhero/card/SlidingCardList.dart';
import 'package:flutter/material.dart';

class SecondHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
        children: [
          SecondHeroTitle(),
          SizedBox(height: 10),
          SecondHeroSubtitle(),
          SizedBox(height: 30),
          SlidingCardList(),
        ],
      ),
    );
  }
}
