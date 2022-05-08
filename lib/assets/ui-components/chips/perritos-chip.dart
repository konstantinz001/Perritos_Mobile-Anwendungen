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
  final PerritosColor color;
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
      backgroundColor: !disabled ? color.color : perritosCharcoal.withOpacity(0.5),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    );
  }

  /*void _changeDisabled() {
    setState(() {
      widget.disabled = !widget.disabled;
    });
  }*/
}
