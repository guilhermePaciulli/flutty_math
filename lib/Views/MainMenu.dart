import 'package:flutter/material.dart';
import 'package:my_app/MathGame/MathGame.dart';
import 'Leadeboard.dart';

class MainMenuView extends StatelessWidget {
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
            width: 172,
            height: 172,
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Text(
              "Flutty Math",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xfffcbf49),
                fontSize: 42,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
              "Simple math game made in flutter!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xfffcbf49),
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 64),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  color: Color(0xffe01e37),
                  child: Icon(
                    Icons.play_arrow,
                    color: Color(0xfffcbf49),
                    size: 48,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MathGame(),
                      ),
                    );
                  },
                ),
                MaterialButton(
                  color: Color(0xffe01e37),
                  child: Icon(
                    Icons.leaderboard,
                    color: Color(0xfffcbf49),
                    size: 48,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LongLeaderboard(),
                      ),
                    );
                  },
                ),
                MaterialButton(
                  color: Color(0xffe01e37),
                  child: Icon(
                    Icons.info,
                    color: Color(0xfffcbf49),
                    size: 48,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
