
import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';
import 'package:google_fonts/google_fonts.dart';

class PerritosDescriptionInput extends StatefulWidget {

  const PerritosDescriptionInput ({
    Key? key,
    this.label = "Label:",
    this.hintTxt = "Text Input",
    this.width = 370,
    required this.onSubmit
  }) : super(key:key);

  final String hintTxt;
  final String label;
  final double width;
  final Function(String) onSubmit;

  @override
  _PerritosDescriptionInputState
  createState() => _PerritosDescriptionInputState();

}

class _PerritosDescriptionInputState
    extends State<PerritosDescriptionInput> {

  late FocusNode myFocusNode;
  final myController = TextEditingController();
  String enteredText = "";

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myFocusNode.addListener(() {
      setState(() {
        myFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: widget.width,
      child: TextFormField(
        style: perritosDoublePica,
        maxLength: 500,
        maxLines: 10,
        onFieldSubmitted: widget.onSubmit,
        onChanged: (value) {
          setState(() { enteredText = value; }
          );
        },
        controller: myController,
        focusNode: myFocusNode,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: perritosCharcoal.withOpacity(0.7),
              width: 2.0
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
            color: perritosMaizeCrayola,
            width: 2.0
          )
        ),
          hintText: widget.hintTxt,
          labelText: widget.label,
          counterText: '${enteredText.length.toString()} / 500',
          counterStyle: GoogleFonts.pompiere(
              color: perritosCharcoal, fontSize: 16),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: myFocusNode.hasFocus ? const TextStyle(color: perritosMaizeCrayola) : perritosDoublePica,
      ),
    )
    );
  }
}