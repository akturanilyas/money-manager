import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class NewEntry extends StatelessWidget {
  static const path = "/new";
  const NewEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Entry'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CupertinoSwitch(
            value: true,
            onChanged: (index) {},
          ),
          Switch(
            value: true,
            onChanged: (i) {},
          ),
          FlutterSwitch(
            activeText: "All Good. Negative.",
            inactiveText: "Under Quarantine.",
            value: true,
            valueFontSize: 10.0,
            width: 110,
            borderRadius: 30.0,
            showOnOff: true,
            onToggle: (val) {
              // setState(() {
              //   status6 = val;
              // });
            },
          ),
        ],
      ),
    );
  }
}
