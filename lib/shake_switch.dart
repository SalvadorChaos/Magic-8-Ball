import 'package:flutter/material.dart';

class ShakeSwitch extends StatelessWidget {
  ShakeSwitch({
    @required this.isSwitchedText,
    @required this.onChanged,
    @required this.value,
  });
  final String isSwitchedText;
  final Function onChanged;
  final bool value;

  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Text('$isSwitchedText' + ' Shake'),
          Switch(
            activeColor: Colors.deepPurpleAccent,
            inactiveThumbColor: Colors.black38,
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
