import 'package:flutter/material.dart';
import 'dart:math';
import 'MathQuestion.dart';
import 'MathGamePoints.dart';
import 'MathGameProgressBar.dart';

enum MathOperations { add, subtract }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MathGame(),
    );
  }
}

class MathGame extends StatefulWidget {
  @override
  _MathGameState createState() => _MathGameState();
}

class _MathGameState extends State<MathGame> with TickerProviderStateMixin {
  List<Widget> _mathQuestions;
  AnimationController _progressBarAnimationController;
  int _points = 0;
  int _currentQuestionIndex = 0;
  final _scrollController = ScrollController();

  void _initializeGame() {
    _currentQuestionIndex = 0;
    _points = 0;
    _mathQuestions = [];
    _mathQuestions = List.generate(
      9,
      (index) => MathQuestion(
        key: ValueKey<int>(index),
        onSelectValue: (isCorrect) {
          _didSelectValue(isCorrect);
        },
      ),
    );
    _progressBarAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(
        () {
          setState(() {});
        },
      );
  }

  void _startProgressBar() {
    _progressBarAnimationController
        .forward()
        .then((value) => _didSelectValue(false));
  }

  void _didSelectValue(bool isCorrect) {
    setState(() {
      _progressBarAnimationController.reset();
      if (isCorrect) {
        _points += 1;
      }
      _currentQuestionIndex++;
      _scrollController
          .animateTo(
            _currentQuestionIndex * MediaQuery.of(context).size.width,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOutExpo,
          )
          .then((value) => _startProgressBar());
    });
  }

  @override
  void initState() {
    _initializeGame();
    // _startProgressBar();
    super.initState();
  }

  @override
  void dispose() {
    _progressBarAnimationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MathGamePoints(
              points: _points,
            ),
            SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              physics: new NeverScrollableScrollPhysics(),
              child: Row(
                children: <Widget>[
                  for (var question in _mathQuestions)
                    Container(
                      child: question,
                      width: MediaQuery.of(context).size.width,
                    ),
                ],
              ),
            ),
            MathGameProgressBar(
              controller: _progressBarAnimationController,
            ),
          ],
        ),
      ),
    );
  }
}
