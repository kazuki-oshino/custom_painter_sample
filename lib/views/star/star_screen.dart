import 'package:custom_painter_sample/views/star/star_painter.dart';
import 'package:flutter/material.dart';

class StarScreen extends StatefulWidget {
  @override
  _StarScreenState createState() => _StarScreenState();
}

class _StarScreenState extends State<StarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Star'),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: CustomPaint(
          // size: Size(double.infinity, double.infinity),
          painter: StarPainter(),
        ),
      ),
    );
  }
}
