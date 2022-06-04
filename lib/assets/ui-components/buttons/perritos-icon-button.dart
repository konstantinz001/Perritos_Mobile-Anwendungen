import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';

class PerritosIconButton extends StatelessWidget {
  PerritosIconButton({
    Key? key,
    required this.onPressed,
    this.label = "",
    this.iconSize = 16,
    required this.icon,
  }) : super(key: key);

  final GestureTapCallback onPressed;
  final String label;
  final IconData icon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Icon(
            icon,
            size: iconSize,
            color: perritosCharcoal.withOpacity(0.7),
          ),
          Text(label, style: perritosParagonOpacity)
        ]));
  }
}
