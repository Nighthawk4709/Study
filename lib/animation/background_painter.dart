import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:study/login/login.dart';

class BackgroundPainter extends CustomPainter {
  final Paint bluePaint;
  final Paint greyPaint;
  final Paint orangePaint;

  BackgroundPainter()
      : bluePaint = Paint()
          ..color = Colors.purple[200]
          ..style = PaintingStyle.fill,
        greyPaint = Paint()
          ..color = Colors.grey
          ..style = PaintingStyle.fill,
        orangePaint = Paint()
          ..color = Colors.grey
          ..style = PaintingStyle.fill;
  @override
  void paint(Canvas canvas, Size size) {
    print(size);
    paintBlue(canvas, size);
  }

  void paintBlue(Canvas canvas, Size size) {
    final path = Path();
    //path where painting will happen
    path.moveTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    _addPointsToPath(path, [
      Point(0, 0),
      Point(size.width / 2, size.height / 2),
      Point(size.width, size.height / 2),
    ]);

    path.close();
    canvas.drawPath(path, bluePaint);
  }

  void paintgrey(Canvas canvas, Size size) {}

  void paintorange(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _addPointsToPath(Path path, List<Point> points) {
    if (points.length < 3) {
      throw UnsupportedError('Need three or more points to create a path.');
    }

    for (var i = 0; i < points.length - 2; i++) {
      final xc = (points[i].x + points[i + 1].x) / 2;
      final yc = (points[i].y + points[i + 1].y) / 2;
      path.quadraticBezierTo(points[i].x, points[i].y, xc, yc);
    }

    // connect the last two points
    path.quadraticBezierTo(
        points[points.length - 2].x,
        points[points.length - 2].y,
        points[points.length - 1].x,
        points[points.length - 1].y);
  }
}

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);
}
