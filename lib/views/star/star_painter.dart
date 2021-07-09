import 'dart:math';

import 'package:flutter/material.dart';

class StarPainter extends CustomPainter {
  final double val;

  StarPainter({required this.val});

  @override
  void paint(Canvas canvas, Size size) {
    double centerWidth = size.width / 2;
    double centerHeight = size.height / 2;

    final _starOffsetList = <Offset>[
      Offset(centerWidth + 90, centerHeight + 120),
      Offset(centerWidth - 145, centerHeight - 45),
      Offset(centerWidth + 145, centerHeight - 45),
      Offset(centerWidth - 90, centerHeight + 120),
      Offset(centerWidth + 0, centerHeight - 145),
    ];

    final _rotateOffsetList =
        _starOffsetList.map((o) => _rotate(o, val, centerWidth, centerHeight)).toList();

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
  /// Q((𝑎−𝑐)cos𝜃−(𝑏−𝑑)sin𝜃+𝑐, (𝑎−𝑐)sin𝜃+(𝑏−𝑑)cos𝜃+𝑑)
  Offset _rotate(Offset old, double radians, double centerWidth, double centerHeight) {
    final dx = (old.dx * cos(radians) - centerWidth * cos(radians)) -
        (old.dy * sin(radians) - centerHeight * sin(radians)) +
        centerWidth;
    final dy = (old.dx * sin(radians) - centerWidth * sin(radians)) +
        (old.dy * cos(radians) - centerHeight * cos(radians)) +
        centerHeight;
    return Offset(dx, dy);
  }
}
