import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserScore {
  @required
  final String name;
  @required
  final int score;
  const UserScore(this.name, this.score);
}

class UserScoreProvider {
  static UserScoreProvider shared = UserScoreProvider();
  String _prefsKey = "flutty_math_leaderboard";
  String _separator = ",";

  List<UserScore> _stringToScores(rawScores) {
    List<UserScore> storedScores = [];
    for (var rawScore in rawScores) {
      final split = rawScore.split(_separator);
      storedScores.add(UserScore(split.first, int.parse(split.last)));
    }
    return storedScores;
  }

  Future<List<UserScore>> getScores() async {
    final prefs = await SharedPreferences.getInstance();
    final stringPrefs = prefs.get(_prefsKey);
    return _stringToScores(stringPrefs);
  }

  Future<void> add(UserScore newScore) async {
    final prefs = await SharedPreferences.getInstance();
    final stringPrefs = prefs.get(_prefsKey);
    final scores = _stringToScores(stringPrefs);
    scores.add(newScore);
    scores.sort((a, b) => b.score.compareTo(a.score));
    List<String> rawScores = [];
    for (var userScore in scores) {
      rawScores.add(userScore.name + _separator + userScore.score.toString());
    }
    prefs.setStringList(_prefsKey, rawScores);
  }
}
