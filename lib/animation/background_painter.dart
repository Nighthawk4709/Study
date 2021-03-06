import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:study/login/login.dart';
import 'dart:math';

class ExtendedColor {
  static const Color darkBlue = Color(0xff092E34);
  static const Color lightBlue = Color(0xff489FB5);
  static const Color orange = Color(0xffFFA62B);
  static const Color darkOrange = Color(0xffCC7700);
}

class BackgroundPainter extends CustomPainter {
  final Animation<double> liquidAnim;
  final Animation<double> blueAnim;
  final Animation<double> greyAnim;
  final Animation<double> orangeAnim;
  final Paint bluePaint;
  final Paint greyPaint;
  final Paint orangePaint;

  BackgroundPainter({Animation<double> animation})
      : bluePaint = Paint()
          ..color = ExtendedColor.lightBlue
          ..style = PaintingStyle.fill,
        greyPaint = Paint()
          ..color = ExtendedColor.darkBlue
          ..style = PaintingStyle.fill,
        orangePaint = Paint()
          ..color = ExtendedColor.darkOrange
          ..style = PaintingStyle.fill,
        liquidAnim = CurvedAnimation(
          parent: animation,
          curve: Curves.elasticOut,
          reverseCurve: Curves.easeInBack,
        ),
        blueAnim = CurvedAnimation(
          parent: animation,
          curve: const SpringCurve(),
          reverseCurve: Curves.easeInCirc,
        ),
        greyAnim = CurvedAnimation(
          parent: animation,
          curve: const Interval(0, 0.8,
              curve: Interval(0, 0.9, curve: SpringCurve())),
        ),
        orangeAnim = CurvedAnimation(
          parent: animation,
          curve: const Interval(0, 0.7,
              curve: Interval(0, 0.8, curve: SpringCurve())),
        ),
        super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    paintBlue(canvas, size);

    paintgrey(canvas, size);

    paintorange(canvas, size);
  }

  void paintBlue(Canvas canvas, Size size) {
    final path = Path();
    //path where painting will happen
    path.moveTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, lerpDouble(0, size.height, blueAnim.value));
    _addPointsToPath(path, [
      Point(lerpDouble(0, size.width / 3, blueAnim.value),
          lerpDouble(0, size.height, blueAnim.value)),
      Point(lerpDouble(size.width / 2, size.width / 4 * 3, liquidAnim.value),
          lerpDouble(size.width / 2, size.height / 4 * 3, liquidAnim.value)),
      Point(size.width,
          lerpDouble(size.height / 2, size.height * 3 / 4, liquidAnim.value)),
    ]);

    path.close();
    canvas.drawPath(path, bluePaint);
  }

  void paintgrey(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width, 300);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(
      0,
      lerpDouble(
        size.height / 4,
        size.height / 2,
        greyAnim.value,
      ),
    );
    _addPointsToPath(
      path,
      [
        Point(
          size.width / 4,
          lerpDouble(size.height / 2, size.height * 3 / 4, liquidAnim.value),
        ),
        Point(
          size.width * 3 / 5,
          lerpDouble(size.height / 4, size.height / 2, liquidAnim.value),
        ),
        Point(
          size.width * 4 / 5,
          lerpDouble(size.height / 6, size.height / 3, greyAnim.value),
        ),
        Point(
          size.width,
          lerpDouble(size.height / 5, size.height / 4, greyAnim.value),
        ),
      ],
    );

    canvas.drawPath(path, greyPaint);
  }

  void paintorange(Canvas canvas, Size size) {
    if (orangeAnim.value > 0) {
      final path = Path();

      path.moveTo(size.width * 3 / 4, 0);
      path.lineTo(0, 0);
      path.lineTo(
        0,
        lerpDouble(0, size.height / 12, orangeAnim.value),
      );

      _addPointsToPath(path, [
        Point(
          size.width / 7,
          lerpDouble(0, size.height / 6, liquidAnim.value),
        ),
        Point(
          size.width / 3,
          lerpDouble(0, size.height / 10, liquidAnim.value),
        ),
        Point(
          size.width / 3 * 2,
          lerpDouble(0, size.height / 8, liquidAnim.value),
        ),
        Point(
          size.width * 3 / 4,
          0,
        ),
      ]);

      canvas.drawPath(path, orangePaint);
    }
  }

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

class SpringCurve extends Curve {
  const SpringCurve({
    this.a = 0.15,
    this.w = 19.4,
  });
  final double a;
  final double w;

  @override
  double transformInternal(double t) {
    return (-pow(e, -t / a) * cos(t * w) + 1).toDouble();
  }
}
