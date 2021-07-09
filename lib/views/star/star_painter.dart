import 'dart:math';

import 'package:flutter/material.dart';

class StarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final _offsetList = <Offset>[];
    _offsetList.add(Offset(90, 120));
    _offsetList.add(Offset(-145, -45));
    _offsetList.add(Offset(145, -45));
    _offsetList.add(Offset(-90, 120));
    _offsetList.add(Offset(0, -145));

    final path = Path()..addPolygon(_offsetList, false);
    canvas.drawPath(
      path,
      Paint()
        ..color = Colors.white
        ..strokeWidth = 1.0,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  Offset _affinTranslate(
    Offset pos, {
    double radians = 0,
    double scale = 1.0,
    double tx = 0,
    double ty = 0,
  }) {
    final dx = scale * (pos.dx * cos(radians) - pos.dy * sin(radians)) + tx;
    final dy = scale * (pos.dx * sin(radians) + pos.dy * cos(radians)) + ty;
    print('dx:$dx, dy:$dy');
    return Offset(dx, dy);
  }
}
