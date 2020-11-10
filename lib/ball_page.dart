import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

import 'ball_image.dart';
import 'shake_switch.dart';

class BallPage extends StatefulWidget {
  @override
  BallPageState createState() => BallPageState();
}

class BallPageState extends State<BallPage> {
  static bool isSwitched = false;
  static String isSwitchedText = 'Enable';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Ask Anything',
        ),
        actions: [
          ShakeSwitch(
            isSwitchedText: isSwitchedText,
            onChanged: (value) {
              setState(() {
                isSwitched = !isSwitched;
                value = isSwitched;
                ShakeDetector detector = ShakeDetector.waitForStart(
                  onPhoneShake: () {
                    print('phone is shaking');
                    if (value == true && isSwitched == true) {
                      setState(() {
                        BallState.ballNumber = Random().nextInt(9) + 1;
                        print('image has changed');
                      });
                    }
                    print('phone stopped shaking');
                  },
                );
                // isSwitched = !isSwitched;
                if (value == true) {
                  isSwitchedText = 'Disable';
                  detector.startListening();
                }
                if (value == false) {
                  isSwitchedText = 'Enable';
                  setState(() {
                    detector.stopListening();
                  });
                }
              });
            },
            value: isSwitched,
          ),
        ],
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Ball(),
    );
  }
}
