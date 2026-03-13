import 'package:flutter/material.dart';

/// A widget that displays the RGB values of a color.
class MyRGBLabel extends StatelessWidget {
  /// Creates a [MyRGBLabel] widget.
  const MyRGBLabel({
    required this.baseBodyStyle,
    required this.isDarkOverlay,
    required this.currentColor,
    super.key,
  });

  /// The base text style for the RGB label.
  final TextStyle baseBodyStyle;

  /// Whether the overlay color is dark or light.
  final bool isDarkOverlay;

  /// allows to display the RGB values.
  final Color currentColor;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'RGB: ',
        style: baseBodyStyle.copyWith(
          // dart format off
          color: isDarkOverlay ? 
              Colors.black54 : 
              Colors.white,
          // dart format on
          fontWeight: FontWeight.bold,
        ),
        children: <TextSpan>[
          TextSpan(
            text:
                '(${(currentColor.r * 255).round()}, '
                '${(currentColor.g * 255).round()}, '
                '${(currentColor.b * 255).round()})',
            style: baseBodyStyle.copyWith(
              // dart format off
              color: isDarkOverlay ? 
                Colors.black54 : 
                Colors.white,
              // dart format on
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
