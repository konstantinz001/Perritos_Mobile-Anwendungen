import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';

class PerritosEditableProfile extends StatefulWidget {
  final IconData icon;

  final String label;

  final GestureTapCallback onPressed;

  final TextEditingController textEditingController;

  final String placeholder;

  PerritosColor perritosColor;

  PerritosEditableProfile(
      {required this.icon,
      required this.label,
      required this.onPressed,
      required this.textEditingController,
      required this.placeholder,
      this.perritosColor = PerritosColor.perritosCharcoal,
      Key? key})
      : super(key: key);

  /// Creates the state of the InputField.
  @override
  _PerritosEditableProfileState createState() =>
      _PerritosEditableProfileState();
}

class _PerritosEditableProfileState extends State<PerritosEditableProfile> {
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
        textAlign: TextAlign.center,
        initialValue: widget.label,
        onChanged: (text) {
          widget.textEditingController.value = TextEditingValue(
            text: text,
          );
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.placeholder,
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
