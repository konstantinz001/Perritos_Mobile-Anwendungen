
import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';

class PerritosTxtInput extends StatefulWidget{

  const PerritosTxtInput ({
    Key? key,
    this.hintTxt = "Text Input",
    this.width = 370,
    required this.onSubmit
  }) : super (key: key);

  final String hintTxt;
  final double width;
  final Function(String) onSubmit;

  @override
  _PerritosTxtInputState createState() => _PerritosTxtInputState();
}

class _PerritosTxtInputState extends State<PerritosTxtInput> {

  late FocusNode myFocusNode;
  final myController = TextEditingController();
  String result = "";

  @override
  void initState() {
    myFocusNode = FocusNode();
    myFocusNode.addListener(() {
      setState(() {
      myFocusNode.hasFocus;
      });
    });
    super.initState();
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
      height: 72,
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
        ),
      ),
    );
  }
}