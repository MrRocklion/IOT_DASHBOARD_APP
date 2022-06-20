import 'package:flutter/material.dart';

class listIcon extends StatefulWidget {
  listIcon(@required this._iconColor);
  final Color _iconColor;
  @override
  State<listIcon> createState() => _listIconState();
}

class _listIconState extends State<listIcon> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index){
        return Icon(
          Icons.adjust,
          color: widget._iconColor,
          size: 16,
        );

      }),
    );
  }
}
