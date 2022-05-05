import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../styles/perritos-colors.dart';
import '../../styles/perritos-fonts.dart';

class PerritosTxtInputLabelOptional extends StatefulWidget {

  const PerritosTxtInputLabelOptional({
    Key? key,
    this.label = "Label:",
    this.hintTxt = "Text Input",
    this.optTxt = "optional value",
    this.width = 370,
    required this.onSubmit
  }) : super(key: key);

  final String label;
  final String hintTxt;
  final String optTxt;
  final double width;
  final Function(String) onSubmit;

  @override
  _PerritosTxtInputLabelOptionalState
    createState() => _PerritosTxtInputLabelOptionalState();
}

class _PerritosTxtInputLabelOptionalState
    extends State<PerritosTxtInputLabelOptional> {

  late FocusNode myFocusNode;
  final myController = TextEditingController();
  String result = "";

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myFocusNode.addListener(() {setState(() {
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
        height: 92,
        width: widget.width,
        child: TextFormField(
          style: perritosDoublePica,
          onFieldSubmitted: widget.onSubmit,
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
              labelStyle: myFocusNode.hasFocus ? const TextStyle(color: perritosMaizeCrayola) : perritosDoublePica,
              counterText: widget.optTxt,
              counterStyle: GoogleFonts.pompiere(
                  color: perritosCharcoal, fontSize: 16),
              floatingLabelBehavior: FloatingLabelBehavior.always
          ),
        )
    );
  }
}
