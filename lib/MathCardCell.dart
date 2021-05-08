// import 'package:flutter/material.dart';
// import 'Drawings.dart';

// class MathCardCell extends StatefulWidget {
//   MathCardCell({Key key, this.value, this.isSelected, this.isRightAnswer})
//       : super(key: key);

//   final int value;
//   final bool isSelected;
//   final bool isRightAnswer;

//   @override
//   _MathCardCellState createState() => _MathCardCellState();
// }

// class _MathCardCellState extends State<MathCardCell> {
//   Widget _currentCardWidget;

//   @override
//   void initState() {
//     super.initState();
//     _currentCardWidget = _MathCellCardValue(
//       value: widget.value,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (widget.isSelected) {
//       _currentCardWidget = _AnswerResponseCell(
//         isRightAnwser: widget.isRightAnswer,
//       );
//     } else {
//       _currentCardWidget = _MathCellCardValue(
//         value: widget.value,
//       );
//     }
//     return AnimatedSwitcher(
//       duration: Duration(milliseconds: 500),
//       child: _currentCardWidget,
//     );
//   }
// }

// class _MathCellCardValue extends StatelessWidget {
//   _MathCellCardValue({this.value});
//   final int value;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       key: ValueKey<int>(0),
//       decoration: BoxDecoration(
//         color: Colors.blue,
//         borderRadius: BorderRadius.all(Radius.circular(8)),
//       ),
//       child: Center(
//         child: Text(
//           value.toString(),
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.w600,
//             fontSize: 36,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );
//   }
// }

// class _AnswerResponseCell extends StatelessWidget {
//   _AnswerResponseCell({this.isRightAnwser});
//   final bool isRightAnwser;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       key: ValueKey<int>(1),
//       decoration: BoxDecoration(
//         color: isRightAnwser ? Colors.lime : Colors.red,
//         borderRadius: BorderRadius.all(Radius.circular(8)),
//       ),
//       child: Center(
//         child: CustomPaint(
//           size: Size.infinite,
//           painter: isRightAnwser
//               ? CheckIconPainter(color: Colors.white)
//               : CrossIconPainter(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class MathCardCell extends StatelessWidget {
  MathCardCell({Key key, this.value, this.didSelect}) : super(key: key);

  final int value;
  final Function() didSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        didSelect();
      },
      child: Container(
        key: ValueKey<int>(0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Center(
          child: Text(
            value.toString(),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 36,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
