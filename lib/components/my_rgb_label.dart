import 'package:color_repository/color_repository.dart';
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
  final RgbColor currentColor;

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
                '(${currentColor.red}, '
                '${currentColor.green}, '
                '${currentColor.blue})',
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
