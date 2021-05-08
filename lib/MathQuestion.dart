import 'package:flutter/material.dart';
import 'dart:math';
import 'MathCardCell.dart';
import 'Drawings.dart';

enum MathOperations { add, subtract }

class MathQuestion extends StatefulWidget {
  MathQuestion({Key key, this.onSelectValue}) : super(key: key);

  final Random random = new Random();
  final Function(bool isCorrect) onSelectValue;

  @override
  _MathQuestionState createState() => _MathQuestionState();
}

class _MathQuestionState extends State<MathQuestion> {
  List<int> _answers;
  int _answer;
  bool _isRightAnswer;
  Widget _mathQuestionState;

  void _didSelectAnswer(int answer) {
    setState(() {
      _isRightAnswer = _answer == answer;
      _mathQuestionState = _AnsweredState(
        isRightAnswer: _isRightAnswer,
      );
      Future.delayed(Duration(milliseconds: 500))
        ..then((value) {
          widget.onSelectValue(_isRightAnswer);
        });
    });
  }

  void _generateQuestion() {
    _isRightAnswer = null;
    _answers = [];
    for (var item in Iterable<int>.generate(9).toList()) {
      var number = widget.random.nextInt(100);
      while (_answers.contains(number)) {
        number = widget.random.nextInt(100);
      }
      _answers.add(number);
    }
    assert(_answers.length == 9);

    int operandOne;
    int operandTwo;
    String sign;

    _answer = _answers[widget.random.nextInt(8)];
    final operation = MathOperations.values[widget.random.nextInt(1)];
    operandTwo = widget.random.nextInt(_answer + 1);
    if (operandTwo != 0) {
      operandTwo -= 1;
    }
    switch (operation) {
      case MathOperations.add:
        operandOne = _answer - operandTwo;
        sign = "+";
        break;
      case MathOperations.subtract:
        operandOne = _answer + operandTwo;
        sign = "-";
        break;
    }
    final _question = operandOne.toString() + sign + operandTwo.toString();
    setState(() {
      _mathQuestionState = _QuestionState(
        answers: _answers,
        didSelectAnswer: (value) => _didSelectAnswer(value),
        question: _question,
      );
    });
  }

  @override
  void initState() {
    _generateQuestion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      child: _mathQuestionState,
      duration: Duration(milliseconds: 500),
    );
  }
}

class _AnsweredState extends StatelessWidget {
  const _AnsweredState({Key key, this.isRightAnswer}) : super(key: key);

  @required
  final bool isRightAnswer;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(64),
      child: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: ClipOval(
            child: Container(
              decoration: BoxDecoration(
                color: isRightAnswer ? Colors.green : Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: CustomPaint(
                size: Size.infinite,
                painter: isRightAnswer
                    ? CheckIconPainter(color: Colors.white)
                    : CrossIconPainter(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _QuestionState extends StatelessWidget {
  const _QuestionState(
      {Key key, this.question, this.answers, this.didSelectAnswer})
      : super(key: key);

  @required
  final String question;
  @required
  final List<int> answers;
  @required
  final Function(int) didSelectAnswer;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _QuestionHeading(question: question),
          _AnswersGrid(
            answers: answers,
            didSelectValue: (ans) => didSelectAnswer(ans),
          )
        ],
      ),
    );
  }
}

class _QuestionHeading extends StatelessWidget {
  const _QuestionHeading({
    Key key,
    @required String question,
  })  : _question = question,
        super(key: key);

  final String _question;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      width: double.infinity,
      height: 56,
      child: Text(
        _question,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 48,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _AnswersGrid extends StatelessWidget {
  const _AnswersGrid({Key key, this.answers, this.didSelectValue})
      : super(key: key);

  final List<int> answers;
  final Function(int) didSelectValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        shrinkWrap: true,
        children: <Widget>[
          for (var value in answers)
            MathCardCell(
              key: ValueKey<int>(value),
              value: value,
              didSelect: () => didSelectValue(value),
            ),
        ],
      ),
    );
  }
}
