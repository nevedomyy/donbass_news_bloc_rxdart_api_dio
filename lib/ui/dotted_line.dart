import 'package:flutter/material.dart';


class DottedLine extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black26
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;
    double length = 0;
    while(length < size.width){
      canvas.drawLine(Offset(length, 0), Offset(length+5, 0), paint);
      length += 2*5;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}