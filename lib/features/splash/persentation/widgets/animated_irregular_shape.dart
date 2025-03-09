import 'package:flutter/material.dart';

import 'irregular_share_painter.dart';
import 'offset_list_tween.dart'; // Import the custom tween

class AnimatedIrregularShape extends StatefulWidget {
  const AnimatedIrregularShape({super.key});

  @override
  _AnimatedIrregularShapeState createState() => _AnimatedIrregularShapeState();
}

class _AnimatedIrregularShapeState extends State<AnimatedIrregularShape>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<List<Offset>> _animation;

  final List<Offset> _initialPoints = [
    const Offset(50, 50),
    const Offset(150, 50),
    const Offset(150, 150),
    const Offset(50, 150),
  ];

  final List<Offset> _finalPoints = [
    const Offset(100, 0),
    const Offset(200, 50),
    const Offset(150, 150),
    const Offset(50, 100),
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = OffsetListTween(
      // Use the custom tween
      begin: _initialPoints,
      end: _finalPoints,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          size: const Size(200, 200),
          painter: IrregularShapePainter(_animation.value),
        );
      },
    );
  }
}
