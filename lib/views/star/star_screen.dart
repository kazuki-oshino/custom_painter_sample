import 'dart:math';

import 'package:custom_painter_sample/views/star/star_painter.dart';
import 'package:flutter/material.dart';

class StarScreen extends StatefulWidget {
  @override
  _StarScreenState createState() => _StarScreenState();
}

class _StarScreenState extends State<StarScreen> with SingleTickerProviderStateMixin {

  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    Tween<double> _rotationTween = Tween(begin: -pi, end: pi);

    animation = _rotationTween.animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Star'),
      ),
      backgroundColor: Colors.black,
      body: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          return CustomPaint(
            size: Size(double.infinity, double.infinity),
            painter: StarPainter(val: -animation.value),
          );
        },
      ),
    );
  }
}
