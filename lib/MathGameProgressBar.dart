import 'package:flutter/material.dart';

class MathGameProgressBar extends StatefulWidget {
  const MathGameProgressBar({Key key, this.controller}) : super(key: key);
  final AnimationController controller;

  @override
  _MathGameProgressBarState createState() => _MathGameProgressBarState();
}

class _MathGameProgressBarState extends State<MathGameProgressBar>
    with SingleTickerProviderStateMixin {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        child: LinearProgressIndicator(
          value: widget.controller.value,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          backgroundColor: Colors.white,
          semanticsLabel: 'Linear progress indicator',
          minHeight: 18,
        ),
      ),
    );
  }
}
