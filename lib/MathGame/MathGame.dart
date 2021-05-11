import 'package:flutter/material.dart';
import 'MathQuestion.dart';
import 'MathGamePoints.dart';
import 'MathGameProgressBar.dart';
import '../Views/SummaryWidget.dart';

class MathGame extends StatefulWidget {
  @override
  _MathGameState createState() => _MathGameState();
}

class _MathGameState extends State<MathGame> with TickerProviderStateMixin {
  List<MathQuestionViewModel> _mathQuestions;
  AnimationController _progressBarAnimationController;
  int _points = 0;
  int _currentQuestionIndex = 0;
  final _scrollController = ScrollController();

  void _initializeGame() {
    _currentQuestionIndex = 0;
    _points = 0;
    _mathQuestions = List.generate(9, (index) => MathQuestionViewModel());
  }

  void _startProgressBar() {
    _progressBarAnimationController
        .forward()
        .then((value) => _didEndQuestion(false));
  }

  void _didSelectAnswer(MathQuestionViewModel question, int answer) {
    setState(() {
      question.isRightAnswer = question.answer == answer;
      Future.delayed(Duration(milliseconds: 500))
        ..then((value) {
          _didEndQuestion(question.isRightAnswer);
        });
    });
  }

  void _didEndQuestion(bool isCorrect) {
    setState(() {
      _progressBarAnimationController.reset();
      if (isCorrect) _points += 1;
      _currentQuestionIndex++;
      if (_currentQuestionIndex + 1 >= _mathQuestions.length) {
        _didEndGame();
        return;
      }
      _scrollController
          .animateTo(
            _currentQuestionIndex * MediaQuery.of(context).size.width,
            duration: Duration(seconds: 1),
            curve: Curves.easeInOutExpo,
          )
          .then((value) => _startProgressBar());
    });
  }

  void _didEndGame() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SummaryView(
          points: _points,
        ),
      ),
    ).then((value) {
      var action = value as SummaryActions;
      switch (action) {
        case SummaryActions.retry:
          setState(() {
            _initializeGame();
            _startProgressBar();
          });
          break;
        case SummaryActions.home:
          break;
        default:
          break;
      }
    });
  }

  @override
  void initState() {
    _progressBarAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(
        () {
          setState(() {});
        },
      );
    _initializeGame();
    _startProgressBar();
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
        color: Color(0xff003049),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MathGamePoints(
              points: _points,
            ),
            Flexible(
              flex: 1,
              child: SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                physics: new NeverScrollableScrollPhysics(),
                child: _MathQuestion(
                  mathQuestions: _mathQuestions,
                  didSelectAnswer: (question, answer) =>
                      _didSelectAnswer(question, answer),
                ),
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

class _MathQuestion extends StatelessWidget {
  const _MathQuestion({
    Key key,
    @required List<MathQuestionViewModel> mathQuestions,
    @required didSelectAnswer,
  })  : _mathQuestions = mathQuestions,
        _didSelectAnswer = didSelectAnswer,
        super(key: key);

  final List<MathQuestionViewModel> _mathQuestions;
  final Function(MathQuestionViewModel, int) _didSelectAnswer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        for (var question in _mathQuestions)
          Container(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: question.isRightAnswer == null
                  ? QuestionState(
                      viewModel: question,
                      didSelectAnswer: (answer) => _didSelectAnswer(
                        question,
                        answer,
                      ),
                    )
                  : AnsweredState(
                      isRightAnswer: question.isRightAnswer,
                    ),
            ),
            width: MediaQuery.of(context).size.width,
          ),
      ],
    );
  }
}
