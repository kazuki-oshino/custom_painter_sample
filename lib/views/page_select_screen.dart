import 'package:custom_painter_sample/views/graph/graph_screen.dart';
import 'package:custom_painter_sample/views/star/star_screen.dart';
import 'package:flutter/material.dart';

import 'button_part.dart';

class PageSelectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonPart(
          nextScreen: GraphScreen(),
          buttonText: 'Graph',
        ),
        ButtonPart(
          nextScreen: StarScreen(),
          buttonText: 'Star',
        ),
      ],
    );
  }
}
