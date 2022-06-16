import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';

class PerritosEditableProfileReadOnly extends StatefulWidget {
  final IconData icon;

  final String label;

  final GestureTapCallback onPressed;

  PerritosColor perritosColor;

  PerritosEditableProfileReadOnly(
      {required this.icon,
      required this.label,
      required this.onPressed,
      this.perritosColor = PerritosColor.perritosCharcoal,
      Key? key})
      : super(key: key);

  /// Creates the state of the InputField.
  @override
  _PerritosEditableProfileReadOnlyState createState() =>
      _PerritosEditableProfileReadOnlyState();
}

class _PerritosEditableProfileReadOnlyState
    extends State<PerritosEditableProfileReadOnly> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
          onTap: widget.onPressed,
          borderRadius: BorderRadius.circular(50),
          child: Column(
            children: [
              Icon(widget.icon, size: 91, color: widget.perritosColor.color),
              Text("ändern", style: perritosParagonOpacity)
            ],
          )),
      TextFormField(
        enabled: false,
        textAlign: TextAlign.center,
        initialValue: widget.label,
        decoration: const InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
        style: perritosDoublePica,
      )
    ]);
  }
}
