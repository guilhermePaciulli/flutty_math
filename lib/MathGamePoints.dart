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
        shape: BoxShape.circle,
        border: Border.all(color: Color(0xfffcbf49), width: 4),
      ),
      margin: EdgeInsets.all(24),
      padding: EdgeInsets.all(4),
      alignment: Alignment.center,
      child: Text(
        _points.toString(),
        style: TextStyle(
          color: Color(0xfffcbf49),
          fontSize: 56,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
