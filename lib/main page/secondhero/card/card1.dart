// File: hero/card1.dart
import 'package:flutter/material.dart';
import 'glass_card.dart';

class Card1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      icon: Icons.star,
      title: 'Special Card 1',
      onTap: () {
        // Handle redirection or any specific action for Card 1
      },
    );
  }
}
