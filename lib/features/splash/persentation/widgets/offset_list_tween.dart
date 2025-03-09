import 'package:flutter/material.dart';

class OffsetListTween extends Tween<List<Offset>> {
  OffsetListTween({
    required List<Offset> begin,
    required List<Offset> end,
  }) : super(begin: begin, end: end);

  @override
  List<Offset> lerp(double t) {
    final result = <Offset>[];
    for (var i = 0; i < begin!.length; i++) {
      final beginOffset = begin![i];
      final endOffset = end![i];
      result.add(Offset.lerp(beginOffset, endOffset, t)!);
    }
    return result;
  }
}
