import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_fade/image_fade.dart';
import 'package:shake/shake.dart';

void main() => runApp(
      MaterialApp(
        title: 'Magic 8 Ball',
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
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.waitForStart(
      onPhoneShake: () {
        print('phone shook');
        setState(() {
          ballNumber = Random().nextInt(9) + 1;
          print('image changed');
        });
      },
    );
    detector.startListening();
  }

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
          child: ImageFade(
            image: AssetImage('images/ball$ballNumber.png'),
          ),
        ),
      ),
    );
  }
}
