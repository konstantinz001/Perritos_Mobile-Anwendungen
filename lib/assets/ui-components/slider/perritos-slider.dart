import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-icons/PerritosIcons_icons.dart';

class PerritosSlider extends StatefulWidget {
  PerritosSlider({Key? key, this.value = 0}) : super(key: key);

  double value;

  @override
  _PerritosSliderState createState() => _PerritosSliderState();
}

class _PerritosSliderState extends State<PerritosSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Row(
              children: [
                const SizedBox(width: 10),
                Icon(
                  PerritosIcons.Icon_Smiley_Happy,
                  size: 21,
                  color: PerritosColor.perritosGoldFusion.color,
                ),
                const Spacer(),
                Icon(
                  PerritosIcons.Icon_Smiley_Sad,
                  size: 21,
                  color: PerritosColor.perritosBurntSienna.color,
                ),
                const SizedBox(width: 10)
              ],
            )),
          ],
        ),
        Row(
          children: [
            Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 4,
                    thumbShape:
                    const RoundSliderThumbShape(enabledThumbRadius: 9.0),
                    overlayShape:
                    const RoundSliderOverlayShape(overlayRadius: 9.0),
                  ),
                  child: Slider(
                      min: 0,
                      max: 10,
                      activeColor: PerritosColor.perritosSandyBrown.color,
                      inactiveColor: PerritosColor.perritosCharcoal.color.withOpacity(0.5),
                      value: widget.value,
                      onChanged: (newValue) {
                        setState(() {
                          widget.value = newValue;
                        });
                      }),
                ))
          ],
        )
      ],
    );
  }
}
