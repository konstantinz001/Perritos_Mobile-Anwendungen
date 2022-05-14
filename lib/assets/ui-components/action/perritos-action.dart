import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';
import 'package:flutter_application/assets/styles/perritos-icons/PerritosIcons_icons.dart';

class PerritosAction extends StatelessWidget {
  const PerritosAction({
    required this.icon,
    required this.label,
    required this.value,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final IconData icon;

  final String label;

  final String value;

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: PerritosColor.perritosCharcoal.color.withOpacity(0.5)
            )
          )
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: 
                Icon(
                  icon, 
                  size: 26, 
                  color: PerritosColor.perritosSandyBrown.color
                ),              
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: perritosDoublePica
                ),
                SizedBox(
                  height: 20,
                  child: Text(
                    value,
                    style: perritosEnglishOpacity
                  ),
                )
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: 
                Icon(
                  PerritosIcons.Icon_Arrow_Right, 
                  size: 26, 
                  color: PerritosColor.perritosCharcoal.color.withOpacity(0.5)
                ),              
            ),
          ]
        ),
      )
    );
  }
}
