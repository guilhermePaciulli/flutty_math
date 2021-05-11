import 'package:flutter/material.dart';

class MathCardCell extends StatelessWidget {
  MathCardCell({Key key, this.value, this.didSelect}) : super(key: key);

  final int value;
  final Function() didSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        didSelect();
      },
      child: Container(
        key: ValueKey<int>(0),
        decoration: BoxDecoration(
          color: Colors.deepOrange.shade300,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Center(
          child: Text(
            value.toString(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 36,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
