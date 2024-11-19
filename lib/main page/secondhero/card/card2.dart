// File: hero/card2.dart
import 'package:flutter/material.dart';
import 'glass_card.dart';

class Card2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      icon: Icons.favorite,
      title: 'Special Card 2',
      onTap: () {
        // Handle redirection or any specific action for Card 2
      },
    );
  }
}
