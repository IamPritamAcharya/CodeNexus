// File: hero/default_card.dart
import 'package:flutter/material.dart';
import 'glass_card.dart';

class DefaultCard extends StatelessWidget {
  final int index;

  DefaultCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      icon: Icons.layers,
      title: 'Card $index',
      onTap: () {
        // Handle redirection for the default cards
      },
    );
  }
}
