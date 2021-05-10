import 'package:flutter/material.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({Key key, this.points}) : super(key: key);

  final int points;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff003049),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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

class Leaderboard extends StatelessWidget {
  const Leaderboard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Leaderboard",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xfffcbf49),
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "#1",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xfffcbf49),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Juvenal",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xfffcbf49),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "15",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xfffcbf49),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )
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
            child: Text(
              "Play again",
              style: TextStyle(
                color: Color(0xfffcbf49),
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () {},
          ),
          MaterialButton(
            color: Color(0xffe01e37),
            child: Text(
              "Menu",
              style: TextStyle(
                color: Color(0xfffcbf49),
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
