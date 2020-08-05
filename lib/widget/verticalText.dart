import 'package:flutter/material.dart';

class VerticalText extends StatefulWidget {
  @override
  _VerticalTextState createState() => _VerticalTextState();
}

class _VerticalTextState extends State<VerticalText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 10),
      child: RotatedBox(
          quarterTurns: -1,
          child: Text(
            'gatego',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 38,
              fontWeight: FontWeight.w900,
            ),
          )),
    );
  }
}