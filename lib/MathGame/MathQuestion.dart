import 'package:flutter/material.dart';
import 'dart:math';
import 'MathCardCell.dart';
import '../Commons/Drawings.dart';

enum MathOperations { add, subtract }

class MathQuestionViewModel {
  List<int> answers;
  int answer;
  String question;
  bool isRightAnswer;

  MathQuestionViewModel() {
    Random random = new Random();
    answers = [];
    for (var _ in Iterable<int>.generate(9).toList()) {
      var number = random.nextInt(100);
      while (answers.contains(number)) {
        number = random.nextInt(100);
      }
      answers.add(number);
    }

    int operandOne;
    int operandTwo;
    String sign;

    answer = answers[random.nextInt(8)];
    final operation = MathOperations.values[random.nextInt(1)];
    operandTwo = random.nextInt(answer + 1);
    if (operandTwo != 0) {
      operandTwo -= 1;
    }
    switch (operation) {
      case MathOperations.add:
        operandOne = answer - operandTwo;
        sign = "+";
        break;
      case MathOperations.subtract:
        operandOne = answer + operandTwo;
        sign = "-";
        break;
    }
    question = operandOne.toString() + sign + operandTwo.toString();
  }
}

class AnsweredState extends StatelessWidget {
  const AnsweredState({Key key, this.isRightAnswer}) : super(key: key);

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
                color: isRightAnswer ? Color(0xff5dd39e) : Colors.red,
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

class QuestionState extends StatelessWidget {
  const QuestionState({Key key, this.viewModel, this.didSelectAnswer})
      : super(key: key);

  final MathQuestionViewModel viewModel;
  final Function(int) didSelectAnswer;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _QuestionHeading(question: viewModel.question),
          _AnswersGrid(
            answers: viewModel.answers,
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
        color: Color(0xffe01e37),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      width: double.infinity,
      height: 56,
      child: Text(
        _question,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
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
