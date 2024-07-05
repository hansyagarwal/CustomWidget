import 'package:flutter/material.dart';
import 'dart:math';

class RingPieChart extends StatelessWidget {
  final List<int> values;
  final List<Color> colors;
  final double width;

  RingPieChart({required this.values, required this.colors, this.width = 20});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(175, 175),
      painter: RingPieChartPainter(values: values, colors: colors, width: width),
    );
  }
}

class RingPieChartPainter extends CustomPainter {
  final List<int> values;
  final List<Color> colors;
  final double width;

  RingPieChartPainter({required this.values, required this.colors, required this.width});

  @override
  void paint(Canvas canvas, Size size) {
    double total = values.fold(0, (sum, value) => sum + value);
    double startAngle = -pi / 2;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width
      ..strokeCap = StrokeCap.butt;

    for (int i = 0; i < values.length; i++) {
      final sweepAngle = (values[i] / total) * 2 * pi;
      paint.color = colors[i];
      canvas.drawArc(
        Rect.fromLTWH(0, 0, size.width, size.height),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}