
import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';

class PerritosDescriptionInput extends StatefulWidget {

  PerritosDescriptionInput ({
    Key? key,
    this.label = "",
    this.hintTxt = "",
    this.width = double.infinity,
    this.initialValue = "",
    this.readOnly = false,
    this.showWordCount = true,
    required this.onSubmit
  }) : super(key:key);

  final String hintTxt;
  final String label;
  String initialValue;
  final double width;
  final Function(String) onSubmit;
  final bool readOnly;
  final bool showWordCount;

  @override
  _PerritosDescriptionInputState
  createState() => _PerritosDescriptionInputState();

}

class _PerritosDescriptionInputState
    extends State<PerritosDescriptionInput> {

  late FocusNode myFocusNode;
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        children: [
          Row( children: [
            const SizedBox(width: 20,),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                widget.label,
                style: myFocusNode.hasFocus ? perritosParagonMaizeCrayola : perritosParagonOpacity,
                textAlign: TextAlign.left,
              ),
            ),
            const Spacer(),
            widget.showWordCount ?
            Container(
              alignment: Alignment.topRight,
              child: Text(
                  '${enteredText.length.toString()} / 500',
                style: perritosEnglishOpacity,
                textAlign: TextAlign.right,
              ),
            )
            :
            Container(),
            const SizedBox(width: 20)
          ],),
          TextFormField(
            initialValue: widget.initialValue,
            style: perritosDoublePica,
            maxLength: 168,
            maxLines: 5,
            onFieldSubmitted: widget.onSubmit,
            onChanged: widget.onSubmit,
            focusNode: myFocusNode,
            readOnly: widget.readOnly,
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
              counterText: "",
            ),
          )
        ],
      )
    );
  }
}