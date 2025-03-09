import 'package:flutter/material.dart';

class FractionShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Draw the horizontal line (fraction bar)
    final fractionBarY = size.height / 2;
    canvas.drawLine(
      Offset(0, fractionBarY),
      Offset(size.width, fractionBarY),
      paint,
    );

    // Draw the numerator (1)
    final textPainter = TextPainter(
      text: const TextSpan(
        text: '1',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    final numeratorX = (size.width - textPainter.width) / 2;
    final numeratorY =
        fractionBarY - textPainter.height - 5; // Position above the bar
    textPainter.paint(canvas, Offset(numeratorX, numeratorY));

    // Draw the denominator (2)
    final denominatorPainter = TextPainter(
      text: const TextSpan(
        text: '2',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    denominatorPainter.layout();
    final denominatorX = (size.width - denominatorPainter.width) / 2;
    final denominatorY = fractionBarY + 5; // Position below the bar
    denominatorPainter.paint(canvas, Offset(denominatorX, denominatorY));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
