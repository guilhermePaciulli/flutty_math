import 'package:flutter/material.dart';

class CheckIconPainter extends CustomPainter {
  CheckIconPainter({@required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 18;

    final double side = size.width;
    Path path = Path();
    path.moveTo(0.25 * side, 0.5 * side);
    path.lineTo(0.45 * side, 0.7 * side);
    path.lineTo(0.75 * side, 0.3 * side);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CheckIconPainter oldDelegate) {
    return false;
  }
}

class CrossIconPainter extends CustomPainter {
  CrossIconPainter({@required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final double margins = size.width * 0.3;
    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 18;
    canvas.drawLine(
      Offset(margins, margins),
      Offset(size.width - margins, size.height - margins),
      paint,
    );
    canvas.drawLine(
      Offset(size.width - margins, margins),
      Offset(margins, size.height - margins),
      paint,
    );
  }

  @override
  bool shouldRepaint(CrossIconPainter oldDelegate) {
    return false;
  }
}
