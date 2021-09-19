import 'package:flutter/material.dart';

class LabeledSwitch extends StatelessWidget {
  const LabeledSwitch({
    Key? key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  final Color activeColor = Colors.green;
  final Color inactiveColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            statusText(),
            Switch(
              activeColor: activeColor,
              inactiveTrackColor: inactiveColor,
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
          ],
        ),
      ),
    );
  }

  Expanded statusText() {
    return Expanded(
      child: Row(
        children: [
          Text(
            'Status: ',
            style: TextStyle(fontSize: 16),
          ),
          value
              ? Text('Income',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w900,
                      fontSize: 16))
              : Text(
                  'Spend',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w900,
                      fontSize: 16),
                ),
        ],
      ),
    );
  }
}
