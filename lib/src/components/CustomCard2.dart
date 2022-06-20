
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
class CardMini extends StatelessWidget {
  CardMini(@required this._value , this._content, this._title,this._color1,this._color2,this._textColor,this._iconSelect);
  final String _value;
  final String _content;
  final String _title;
  final Color _color1;
  final Color _color2;
  final Color _textColor;
  final Icon _iconSelect;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        height: 140,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          gradient: LinearGradient(
            colors: [this._color1, this._color2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent,

            ),
          ],
        ),
      ),
      Positioned(
        top: 0,
        bottom: 0,
        right: 0,
        child: CustomPaint(
          size: Size(60, 150),
          painter: _shapeCard(24.0,this._color1, this._color2),
        ),
      ),
      Positioned.fill(
        child: Row(
          children: <Widget>[
            SizedBox(width: 5,),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this._title,
                    style: TextStyle(
                        color: this._textColor,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: 16
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    this._content,
                    style: TextStyle(
                      color: this._textColor,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  this._iconSelect,
                  Text(this._value,style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700
                  ),

                  ),
                ],
              ),
            )
          ],
        ),
      )
    ]);
  }
}

class _shapeCard extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;
  _shapeCard(this.radius, this.startColor, this.endColor);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);
    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
