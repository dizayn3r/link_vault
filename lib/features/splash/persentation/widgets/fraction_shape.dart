import 'package:flutter/material.dart';

import 'fraction_shape_painter.dart';

class FractionShape extends StatelessWidget {
  const FractionShape({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(100, 60), // Adjust size as needed
      painter: FractionShapePainter(),
    );
  }
}
