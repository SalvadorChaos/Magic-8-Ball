import 'package:flutter/material.dart';

import 'ball_page.dart';

void main() => runApp(Magic8Ball());

class Magic8Ball extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic 8 Ball',
      home: BallPage(),
    );
  }
}
