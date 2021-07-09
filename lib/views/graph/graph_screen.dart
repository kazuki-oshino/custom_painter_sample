import 'package:flutter/material.dart';

import 'graph_painter.dart';

class GraphScreen extends StatefulWidget {
  @override
  _GraphScreenState createState() => _GraphScreenState();

}

double counter = 0;

class _GraphScreenState extends State<GraphScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          counter++;
        });
      },
      child: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text('graph'),
        ),
        body: CustomPaint(
          size: Size(double.infinity, double.infinity),
          painter: GraphPainter(),
        ),
      ),
    );
  }
}
