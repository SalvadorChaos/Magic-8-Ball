import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(
          child: Text(
            'Ask Me Anything',
          ),
        ),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FlatButton(
          onPressed: () {
            setState(() {
              ballNumber = Random().nextInt(9) + 1;
            });
          },
          child: Image(
            image: AssetImage('images/ball$ballNumber.png'),
          ),
        ),
      ),
    );
  }
}
