import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';
import 'package:flutter_application/assets/styles/perritos-icons/PerritosIcons_icons.dart';

class PerritosProfile extends StatelessWidget {
  PerritosProfile({
    required this.icon,
    required this.label,
    this.perritosColor = PerritosColor.perritosCharcoal,
    this.edit = false,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final IconData icon;

  final String label;

  final GestureTapCallback onPressed;

  bool edit;

  PerritosColor perritosColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(children: [
        edit == false ?
        Icon(
          icon, 
          size: 91, 
          color: perritosColor.color
        ):
        Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              icon, 
              size: 91, 
              color: perritosColor.color.withOpacity(0.5)
            ),
            Icon(
              PerritosIcons.Icon_Edit, 
              size: 59, 
              color: PerritosColor.perritosCharcoal.color
            )
          ]
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: perritosDoublePica,
        )
      ])
    );
  }
}
