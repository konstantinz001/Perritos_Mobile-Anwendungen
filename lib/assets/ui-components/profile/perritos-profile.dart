import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';

class PerritosProfile extends StatelessWidget {
  const PerritosProfile({
    required this.icon,
    required this.label,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final IconData icon;

  final String label;

  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(50),
          child: Icon (
            icon, 
            size: 91,
          ),
        ),
        TextFormField(
          textAlign: TextAlign.center,
          initialValue: label,
          decoration: const InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
          style: perritosDoublePica,
        )
      ]
    );
  }
}
