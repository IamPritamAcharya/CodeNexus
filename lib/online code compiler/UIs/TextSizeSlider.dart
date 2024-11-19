import 'package:flutter/material.dart';

class TextSizeSlider extends StatelessWidget {
  final double textSize;
  final ValueChanged<double> onTextSizeChanged;
  final bool isSmallScreen;

  const TextSizeSlider({
    Key? key,
    required this.textSize,
    required this.onTextSizeChanged,
    this.isSmallScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set slider width based on screen size
    double sliderWidth = isSmallScreen ? 400.0 : 300.0; // Adjust these values as needed

    return SizedBox(
      width: sliderWidth,
      child: SliderTheme(
        data: SliderThemeData(
          activeTrackColor: Colors.teal.withOpacity(0.7),
          inactiveTrackColor: Colors.tealAccent.shade100.withOpacity(0.11),
          overlayColor: Colors.teal.withOpacity(0.2),
          thumbShape: CustomSliderThumbIcon(icon: Icons.hdr_auto, size: 25.0),
          trackHeight: 4.0,
        ),
        child: Slider(
          value: textSize,
          min: 5,
          max: 24,
          divisions: 14,
          label: "${textSize.toStringAsFixed(0)} pt",
          onChanged: onTextSizeChanged,
        ),
      ),
    );
  }
}

// Custom thumb shape for icon
class CustomSliderThumbIcon extends SliderComponentShape {
  final IconData icon;
  final double size;

  CustomSliderThumbIcon({required this.icon, this.size = 24.0});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => Size(size, size);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;

    // Draw the icon at the thumb position
    final iconPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: size,
          color: Colors.tealAccent.withOpacity(0.9),
          fontFamily: icon.fontFamily,
          package: icon.fontPackage,
        ),
      ),
      textDirection: textDirection,
    );
    iconPainter.layout();
    iconPainter.paint(canvas, center - Offset(size / 2, size / 2));
  }
}
