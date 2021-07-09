import 'dart:collection';

import 'package:custom_painter_sample/views/graph/graph_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'dart:math';

class GraphPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    // 使用データ作成
    Map<DateTime, double> data = _makeData();
    int dataLength = data.length - 1;
    double padding = 50;
    double graphWidth = size.width - 2 * padding;
    double graphHeight = size.height - 2 * padding;
    int horizontalLine = 5;
    int topScaleNumber = _calcTopScaleNumber(data);

    // X軸描画
    writeXAxis(
      padding,
      size,
      dataLength,
      canvas,
      graphWidth,
      data,
      graphHeight,
      topScaleNumber,
    );

    // Y軸描画
    writeYAxis(
      horizontalLine,
      canvas,
      padding,
      size,
      graphHeight,
      topScaleNumber,
    );
  }

  Map<DateTime, double> _makeData() {
    final now = DateTime.now();
    Map<DateTime, double> data = {
      now.add(Duration(days: -6)): counter,
      now.add(Duration(days: -5)): 40,
      now.add(Duration(days: -4)): 12,
      now.add(Duration(days: -3)): 23,
      now.add(Duration(days: -2)): 12,
      now.add(Duration(days: -1)): 56,
      now: 3,
    };

    data = SplayTreeMap.from(data, (a, b) => a.compareTo(b));
    return data;
  }

  int _calcTopScaleNumber(Map<DateTime, double> data) {
    int topScaleNumber = 0;
    double maxValue = data.values.toList().reduce(max);
    int digits = maxValue.round().toString().length;
    topScaleNumber =
        ((maxValue ~/ pow(10, digits - 1) + 1) * pow(10, digits - 1)).toInt();
    return topScaleNumber;
  }

  void writeXAxis(
      double padding,
      Size size,
      int dataLength,
      Canvas canvas,
      double graphWidth,
      Map<DateTime, double> data,
      double graphHeight,
      int topScaleNumber) {
    Path fillPath = Path();

    // 初期位置設定
    fillPath.moveTo(padding, size.height - padding);

    for (int i = 0; i <= dataLength; i++) {
      canvas.drawLine(
        Offset(graphWidth / dataLength * i + padding, 50),
        Offset(graphWidth / dataLength * i + padding, size.height - 50),
        Paint()
          ..strokeWidth = 1
          ..color = Colors.white,
      );
      TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(
          text: DateFormat('M/d').format(data.keys.toList()[i]),
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      )
        ..layout()
        ..paint(
          canvas,
          Offset(graphWidth / dataLength * i + padding - 10,
              size.height - 50 + 10),
        );
      canvas.drawCircle(
        Offset(
          graphWidth / dataLength * i + padding,
          size.height -
              padding -
              graphHeight / topScaleNumber * data.values.toList()[i],
        ),
        5,
        Paint()..color = Colors.white,
      );

      fillPath.lineTo(
        graphWidth / dataLength * i + padding,
        size.height -
            padding -
            graphHeight / topScaleNumber * data.values.toList()[i],
      );
    }

    fillPath.lineTo(size.width - padding, size.height - padding);
    fillPath.close();
    canvas.drawPath(
      fillPath,
      Paint()..color = Colors.white.withOpacity(0.3),
    );
  }

  void writeYAxis(int horizontalLine, Canvas canvas, double padding, Size size,
      double graphHeight, int topScaleNumber) {
    for (int i = 0; i <= horizontalLine; i++) {
      canvas.drawLine(
        Offset(
          padding - 10,
          size.height - padding - graphHeight / horizontalLine * i,
        ),
        Offset(
          size.width - padding + 10,
          size.height - padding - graphHeight / horizontalLine * i,
        ),
        Paint()..color = Colors.white,
      );

      TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(
          text: (topScaleNumber / horizontalLine * i).round().toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      )
        ..layout()
        ..paint(
          canvas,
          Offset(padding - 35,
              size.height - padding - graphHeight / horizontalLine * i - 6),
        );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
