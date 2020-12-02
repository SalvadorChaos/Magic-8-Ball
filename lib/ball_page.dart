import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hardware_buttons/hardware_buttons.dart' as HardwareButtons;
import 'package:shake/shake.dart';
import 'package:system_shortcuts/system_shortcuts.dart';

import 'ball_image.dart';
import 'shake_switch.dart';

class BallPage extends StatefulWidget {
  @override
  BallPageState createState() => BallPageState();
}

class BallPageState extends State<BallPage> {
  static bool isSwitched = false;
  static String isSwitchedText = 'Enable';

  Future<bool> homeButtonPress() async {
    await SystemShortcuts.home();
    return true;
  }

  Future<bool> _onBackPressed() {
    setState(() {
      isSwitched = false;
      isSwitchedText = 'Enable';
    });
    return homeButtonPress();
  }

  // String _latestHardwareButtonEvent;

  StreamSubscription<HardwareButtons.HomeButtonEvent> _homeButtonSubscription;

  @override
  void initState() {
    super.initState();
    _homeButtonSubscription = HardwareButtons.homeButtonEvents.listen((event) {
      setState(() {
        // _latestHardwareButtonEvent = 'HOME_BUTTON';
        _onBackPressed();
        // dispose();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _homeButtonSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            'Ask Anything',
          ),
          actions: [
            ShakeSwitch(
              value: isSwitched,
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
            ),
          ],
        ),
        backgroundColor: Colors.deepPurpleAccent,
        body: Ball(),
      ),
    );
  }
}
