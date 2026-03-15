import 'package:flutter/material.dart';

/// A widget that displays the RGB values of a color.
class MyRGBLabel extends StatelessWidget {
  /// Creates a [MyRGBLabel] widget.
  const MyRGBLabel({
    required this.isDarkOverlay,
    required this.currentColor,
    super.key,
  });

  /// Whether the overlay color is dark or light.
  final bool isDarkOverlay;

  /// allows to display the RGB values.
  final Color currentColor;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle baseBodyStyle =
        textTheme.bodyMedium ??
        const TextStyle(
          fontSize: 14,
        );

    return RichText(
      text: TextSpan(
        text: 'RGB: ',
        style: baseBodyStyle.copyWith(
          color: isDarkOverlay ? Colors.black54 : Colors.white,
          fontWeight: FontWeight.bold,
        ),
        children: <TextSpan>[
          TextSpan(
            text:
                '(${(currentColor.r * 255).round()}, '
                '${(currentColor.g * 255).round()}, '
                '${(currentColor.b * 255).round()})',
            style: baseBodyStyle.copyWith(
              color: isDarkOverlay ? Colors.black54 : Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
