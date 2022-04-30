import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

const Color perritosCharcoal = Color(0xFF264653);
const Color perritosGoldFusion = Color(0xFF88855F);
const Color perritosMaizeCrayola = Color(0xFFE9C46A);
const Color perritosSandyBrown = Color(0xFFF4A261);
const Color perritosBurntSienna = Color(0xFFE76F51);
const Color perritosSnow = Color(0xFFFAF6F4);

enum PerritosColor {
  perritosCharcoal,
  perritosGoldFusion,
  perritosMaizeCrayola,
  perritosSandyBrown,
  perritosBurntSienna,
  perritosSnow
}

extension PerritosColorExtension on PerritosColor {
  Color get color {
    switch (this) {
      case PerritosColor.perritosCharcoal:
        return perritosCharcoal;
      case PerritosColor.perritosGoldFusion:
        return perritosGoldFusion;
      case PerritosColor.perritosMaizeCrayola:
        return perritosMaizeCrayola;
      case PerritosColor.perritosBurntSienna:
        return perritosBurntSienna;
      case PerritosColor.perritosSnow:
        return perritosSnow;
      default:
        return perritosCharcoal;
    }
  }
}
