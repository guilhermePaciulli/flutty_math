import 'package:flutter/material.dart';
import 'Leadeboard.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({Key key, this.points}) : super(key: key);

  final int points;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff003049),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/rocket.png",
            width: 124,
            height: 124,
          ),
          Container(
            margin: EdgeInsets.only(top: 32),
            child: Text(
              "You scored " + points.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xfffcbf49),
                fontSize: 42,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Leaderboard(),
          _SummaryActions()
        ],
      ),
    );
  }
}

class _SummaryActions extends StatelessWidget {
  const _SummaryActions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
            color: Color(0xffe01e37),
            child: Icon(
              Icons.replay_outlined,
              color: Color(0xfffcbf49),
              size: 48,
            ),
            onPressed: () {},
          ),
          MaterialButton(
            color: Color(0xffe01e37),
            child: Icon(
              Icons.save,
              color: Color(0xfffcbf49),
              size: 48,
            ),
            onPressed: () {},
          ),
          MaterialButton(
            color: Color(0xffe01e37),
            child: Icon(
              Icons.home,
              color: Color(0xfffcbf49),
              size: 48,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
