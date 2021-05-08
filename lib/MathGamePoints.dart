import 'package:flutter/material.dart';

class MathGamePoints extends StatelessWidget {
  const MathGamePoints({
    Key key,
    @required int points,
  })  : _points = points,
        super(key: key);

  final int _points;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      width: double.infinity,
      child: Text(
        "Points: " + _points.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 36,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
