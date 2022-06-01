
import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';

class PerritosDescriptionInput extends StatefulWidget {

  const PerritosDescriptionInput ({
    Key? key,
    this.label = "",
    this.hintTxt = "Text Input",
    this.width = double.infinity,
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
      height: 400,
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
            Container(
              alignment: Alignment.topRight,
              child: Text(
                  '${enteredText.length.toString()} / 500',
                style: perritosEnglishOpacity,
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(width: 20)
          ],),
          TextFormField(
            style: perritosDoublePica,
            maxLength: 168,
            maxLines: 5,
            onFieldSubmitted: widget.onSubmit,
            onChanged: (value) {
              setState(() { enteredText = value; });
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
              counterText: "",
            ),
          )
        ],
      )
    );
  }
}