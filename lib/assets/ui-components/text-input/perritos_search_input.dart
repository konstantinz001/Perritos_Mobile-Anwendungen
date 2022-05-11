

import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-icons/perritos_icons.dart';

import '../../styles/perritos-colors.dart';
import '../../styles/perritos-fonts.dart';

class PerritosSearchInput extends StatefulWidget{

  const PerritosSearchInput ({
    Key? key,
    this.hintTxt = "Search",
    this.width = double.infinity,
    required this.onSubmit
  }) : super(key: key);

  final String hintTxt;
  final double width;
  final Function(String) onSubmit;

  @override
  _PerritosSearchInputState createState() => _PerritosSearchInputState();

}

class _PerritosSearchInputState extends State<PerritosSearchInput> {

  late FocusNode myFocusNode;
  final myController = TextEditingController();
  String result = "";

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
            prefixIcon: const Icon(PerritosIcons.Icon_Search, color: perritosCharcoal,), //TODO: Icon ändern
          ),
        )
    );
  }

}