import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';

class PerritosSnackBar extends StatelessWidget {
  PerritosSnackBar({Key? key, required this.message, required this.error})
      : super(key: key);

  final String message;
  final bool error;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
        content: Text(message, style: perritosDoublePica),
        backgroundColor: error ? perritosBurntSienna : perritosGoldFusion);
  }
}
