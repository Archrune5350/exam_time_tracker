
import 'package:flutter/material.dart';

enum SpacingType {
  text,
  element,
}
class CustomSpacing extends StatelessWidget {
  final SpacingType type;

  const CustomSpacing(this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    const double spaceBetweenElements = 12.0;
    const double spaceBetweenText = 2.0;

    switch (type) {
      case SpacingType.text:
        return const SizedBox(height: spaceBetweenText);
      case SpacingType.element:
        return const SizedBox(height: spaceBetweenElements);
    }
  }
}