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
      width: double.infinity,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Icon(
            Icons.star,
            color: Colors.yellow.shade600,
            size: 102,
          ),
          Text(
            _points.toString(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
