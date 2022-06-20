import 'package:iot_firebase_dashboard/src/components/listIcon.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CustomCard1 extends StatefulWidget {

  CustomCard1(@required this. _value, this._content, this._title,this._color1,this._color2,this._textColor,this._listColor,this._iconSelect);
  final double _value;
  final String _content;
  final String _title;
  final Color _color1;
  final Color _color2;
  final Color _textColor;
  final Color _listColor;
  final Icon _iconSelect;



  @override
  State<CustomCard1> createState() => _CustomCard1State();
}

class _CustomCard1State extends State<CustomCard1> {

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          gradient: LinearGradient(
            colors: [widget._color1, widget._color2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: widget._color1,

            ),
          ],
        ),
      ),
      Positioned(
        top: 0,
        bottom: 0,
        right: 0,
        child: CustomPaint(
          size: Size(100, 150),
          painter: _shapeCard(24.0, widget._color1, widget._color2),
        ),
      ),
      Positioned.fill(
        child: Row(
          children: <Widget>[
            Expanded(
              child: widget._iconSelect,
              flex: 2,
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget._title,
                    style: TextStyle(
                        color: widget._textColor,
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.w700,
                        fontSize: 20
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    widget._content,
                    style: TextStyle(
                      color: widget._textColor,
                      fontFamily: 'Avenir',
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
                  Text(widget._value.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: "Roboto",
                        fontSize: 36,
                        color: widget._textColor
                    ),

                  ),
                  listIcon(widget._listColor),
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
