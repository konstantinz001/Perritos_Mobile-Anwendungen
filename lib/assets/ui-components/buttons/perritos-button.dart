import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';

enum PerritosButtonTheme { normal, danger, good }

class PerritosButton extends StatelessWidget {
  PerritosButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.disabled = false,
    this.theme = PerritosButtonTheme.normal
  }) : super(key: key);

  final GestureTapCallback onPressed;
  final String label;
  bool disabled;
  PerritosButtonTheme theme;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 72,
      minWidth: double.infinity,
      child: MaterialButton(
        height: 72,
        color: 
          theme == PerritosButtonTheme.normal && !disabled ? perritosMaizeCrayola : 
          theme == PerritosButtonTheme.normal && disabled ? perritosMaizeCrayola.withOpacity(0.5) : 
          theme == PerritosButtonTheme.danger && !disabled ? perritosBurntSienna: 
          theme == PerritosButtonTheme.danger && disabled  ? perritosBurntSienna.withOpacity(0.5): 
          !disabled ? perritosGoldFusion : perritosGoldFusion.withOpacity(0.5),
        onPressed: disabled ? () => {} : onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: !disabled ? perritosCharcoal : perritosCharcoal.withOpacity(0.5), 
            width: 2.0,
          ),
        ),
        child: Text(
          label,
          style: 
            theme == PerritosButtonTheme.normal && !disabled ? perritosDoublePica : 
            theme == PerritosButtonTheme.normal && disabled ? perritosDoublePicaOpacity : 
            !disabled ? perritosDoublePicaLight:
            perritosDoublePicaLightOpacity,
        ),
      ),
    );
  }
}
