import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:google_fonts/google_fonts.dart';

// named after: https://en.wikipedia.org/wiki/Traditional_point-size_names

//Double Paragon:
TextStyle perritosDoubleParagon =
    GoogleFonts.pompiere(color: perritosCharcoal, fontSize: 40);

TextStyle perritosDoubleParagonLight =
    GoogleFonts.pompiere(color: perritosSnow, fontSize: 40);

//Double Pica:
TextStyle perritosDoublePica =
    GoogleFonts.pompiere(color: perritosCharcoal, fontSize: 24);

TextStyle? perritosDoublePicaOpacity = GoogleFonts.pompiere(
    color: perritosCharcoal.withOpacity(0.5), fontSize: 24);

TextStyle perritosDoublePicaLight =
    GoogleFonts.pompiere(color: perritosSnow, fontSize: 24);

TextStyle perritosDoublePicaLightOpacity =
    GoogleFonts.pompiere(color: perritosSnow.withOpacity(0.5), fontSize: 24);

TextStyle perritosDoublePicaError =
    GoogleFonts.pompiere(color: perritosBurntSienna, fontSize: 24);

//Paragon:
TextStyle perritosParagon =
    GoogleFonts.pompiere(color: perritosCharcoal, fontSize: 20);

TextStyle perritosParagonLight =
    GoogleFonts.pompiere(color: perritosSnow, fontSize: 20);

TextStyle perritosParagonOpacity = GoogleFonts.pompiere(
    color: perritosCharcoal.withOpacity(0.7), fontSize: 20);

TextStyle perritosParagonMaizeCrayola =
    GoogleFonts.pompiere(color: perritosMaizeCrayola, fontSize: 20);

TextStyle perritosParagonGoldFusion =
    GoogleFonts.pompiere(color: perritosGoldFusion, fontSize: 20);

TextStyle perritosParagonError=
    GoogleFonts.pompiere(color: perritosBurntSienna, fontSize: 20);

//English:
TextStyle perritosEnglish =
    GoogleFonts.pompiere(color: perritosCharcoal, fontSize: 14);

TextStyle perritosEnglishOpacity = GoogleFonts.pompiere(
    color: perritosCharcoal.withOpacity(0.7), fontSize: 14);
