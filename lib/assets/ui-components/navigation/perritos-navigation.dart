import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/assets/styles/perritos-colors.dart';
import 'package:flutter_application/assets/styles/perritos-icons/PerritosIcons_icons.dart';

enum activeView {home, calendar, profile}

class PerritosNavigationBar extends StatefulWidget {

  final activeView;

  final void Function() navigateToHome;
  final void Function() navigateToCalendar;
  final void Function() navigateToProfile;

  PerritosNavigationBar({
    Key? key,
    required this.activeView,
    required this.navigateToHome,
    required this.navigateToCalendar,
    required this.navigateToProfile
  }) :  super(key: key);

  @override
  State<StatefulWidget> createState() => _PerritosNavigationBarState();
}

class _PerritosNavigationBarState extends State<PerritosNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        border: Border.all(
            color: PerritosColor.perritosCharcoal.color.withOpacity(0.7),
            width: 1.0),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: Icon(
              PerritosIcons.Icon_Home,
              size: 32,
              color: widget.activeView == activeView.home
                  ? PerritosColor.perritosSandyBrown.color
                  : PerritosColor.perritosCharcoal.color,
            ),
            onPressed: widget.navigateToHome,
          ),
          IconButton(
            icon: Icon(
              PerritosIcons.Icon_Date,
              size: 32,
              color: widget.activeView == activeView.calendar
                  ? PerritosColor.perritosSandyBrown.color
                  : PerritosColor.perritosCharcoal.color,
            ),
            onPressed: widget.navigateToCalendar,
          ),
          IconButton(
            icon: Icon(
              PerritosIcons.Icon_Dog,
              size: 32,
              color: widget.activeView == activeView.profile
                  ? PerritosColor.perritosSandyBrown.color
                  : PerritosColor.perritosCharcoal.color,
            ),
            onPressed: widget.navigateToProfile,
          )
        ],
      ),
    );
  }
}
