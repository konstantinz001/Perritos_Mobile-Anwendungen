import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-fonts.dart';
import 'package:flutter_application/assets/styles/perritos-icons/PerritosIcons_icons.dart';

class ProfileIcon {
  IconData icon;
  PerritosColor color;
  ProfileIcon(this.icon, this.color);
}

class PerritosAction extends StatelessWidget {
  PerritosAction({
    required this.icon,
    required this.label,
    required this.value,
    required this.onPressed,
    List<ProfileIcon>? profileIcons
  }) : profileIcons = profileIcons ?? [] ;

  final IconData icon;

  final String label;

  final String value;

  final GestureTapCallback onPressed;

  List<ProfileIcon> profileIcons;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 2,
                      color: PerritosColor.perritosCharcoal.color
                          .withOpacity(0.5)))),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Icon(icon,
                  size: 26, color: PerritosColor.perritosSandyBrown.color),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: perritosDoublePica),
                SizedBox(
                  height: 20,
                  child: Text(value, style: perritosEnglishOpacity),
                )
              ],
            ),
            const Spacer(),
            profileIcons.isEmpty
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Icon(
                      PerritosIcons.Icon_Arrow_Right,
                      size: 26,
                      color: PerritosColor.perritosCharcoal.color
                            .withOpacity(0.5)),
                  )
                : Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Icon(
                          profileIcons.first.icon,
                          size: 26,
                          color: profileIcons.first.color.color
                        ),
                        for(var profileIcon in profileIcons)
                          Positioned(
                              right: profileIcons.indexOf(profileIcon).toDouble() * 13,
                              child: Stack(
                                children: [
                                  Container(
                                    width: 26,
                                    height: 26,
                                    decoration: BoxDecoration(
                                      color: PerritosColor.perritosSnow.color,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Icon(profileIcon.icon,
                                      size: 26,
                                      color:
                                          profileIcon.color.color
                                  )
                                ],
                              )),
                      ],
                    ))
          ]),
        ));
  }
}
