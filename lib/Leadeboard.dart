import 'package:flutter/material.dart';

class UserScore {
  @required
  final String name;
  @required
  final int score;
  const UserScore(this.name, this.score);

  static List<UserScore> _sharedScores = [
    UserScore("Juvenal", 10),
    UserScore("Jovial", 9),
    UserScore("Joleno", 8),
  ];

  static List<UserScore> shortSharedScores() {
    return _sharedScores.length <= 3
        ? _sharedScores
        : _sharedScores.sublist(0, 3);
  }

  static void add(UserScore score) {
    _sharedScores.add(score);
    _sharedScores.sort((a, b) => b.score.compareTo(a.score));
  }
}

class Leaderboard extends StatelessWidget {
  Leaderboard({Key key}) : super(key: key);

  final List<UserScore> scores = UserScore.shortSharedScores();
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
          for (var index in List.generate(scores.length, (index) => index + 1))
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
  const _LeadeboardScore({Key key, this.userScore, this.index})
      : super(key: key);

  @required
  final UserScore userScore;
  @required
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
