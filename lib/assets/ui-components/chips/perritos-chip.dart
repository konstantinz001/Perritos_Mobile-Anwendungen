import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';

class PerritosChip extends StatelessWidget {
  PerritosChip(
      {Key? key,
      required this.label,
      required this.color,
      required this.onPressed,
      this.disabled = false})
      : super(key: key);

  final String label;
  final Color color;
  GestureTapCallback onPressed;
  bool disabled;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: onPressed,
      label: Text(
        label,
        style:
            disabled ? perritosDoublePicaLightOpacity : perritosDoublePicaLight,
      ),
      backgroundColor: !disabled ? color : Colors.grey,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    );
  }

  /*void _changeDisabled() {
    setState(() {
      widget.disabled = !widget.disabled;
    });
  }*/
}
