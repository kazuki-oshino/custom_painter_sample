import 'dart:math';

import 'package:flutter/material.dart';

class StarPainter extends CustomPainter {
  final double val;

  StarPainter({required this.val});

  @override
  void paint(Canvas canvas, Size size) {
    final _starOffsetList = <Offset>[
      Offset(90, 120),
      Offset(-145, -45),
      Offset(145, -45),
      Offset(-90, 120),
      Offset(0, -145),
    ];

    final _rotateOffsetList =
        _starOffsetList.map((o) => _rotate(o, val)).toList();

    final path = Path()..addPolygon(_rotateOffsetList, false);
    canvas.drawPath(
      path,
      Paint()
        ..color = Colors.yellow
        ..strokeWidth = 1.0,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  /// 回転の公式を利用し、指定したラジアンで回転させた場合のOffsetを返す
  Offset _rotate(Offset old, double radians) {
    final dx = old.dx * cos(radians) - old.dy * sin(radians);
    final dy = old.dx * sin(radians) + old.dy * cos(radians);
    return Offset(dx, dy);
  }
}
