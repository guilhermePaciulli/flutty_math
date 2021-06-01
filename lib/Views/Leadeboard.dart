import 'package:flutter/material.dart';
import '../Commons/UserScoreProvider.dart';

class LongLeaderboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff003049),
      appBar: AppBar(
        title: Text("Leaderboard"),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Color(0xfffcbf49)),
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Color(0xfffcbf49),
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: UserScoreProvider.shared.getScores(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return _Leaderboard(
                scores: snapshot.data,
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

class ShortLeaderboard extends StatelessWidget {
  List<UserScore> _shortScoreList(scores) {
    return scores.length >= 3 ? scores.sublist(0, 3) : scores;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserScoreProvider.shared.getScores(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return _Leaderboard(
            scores: _shortScoreList(snapshot.data),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class _Leaderboard extends StatelessWidget {
  _Leaderboard({Key key, @required this.scores}) : super(key: key);

  final List<UserScore> scores;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (scores.isEmpty)
            Text(
              "No scores were saved!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xfffcbf49),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            )
          else
            for (var index
                in List.generate(scores.length, (index) => index + 1))
              _LeadeboardScore(
                userScore: scores[index - 1],
                index: index,
              ),
        ],
      ),
    );
  }
}

class _LeadeboardScore extends StatelessWidget {
  const _LeadeboardScore(
      {Key key, @required this.userScore, @required this.index})
      : super(key: key);

  final UserScore userScore;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Color(0xfffcbf49)),
        ),
      ),
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "#" + index.toString(),
            style: TextStyle(
              color: Color(0xfffcbf49),
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            userScore.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xfffcbf49),
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            userScore.score.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xfffcbf49),
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
