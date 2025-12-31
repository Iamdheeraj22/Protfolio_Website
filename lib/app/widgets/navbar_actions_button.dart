import 'package:flutter/material.dart';
import 'package:mysite/analytics_tracking/analytics_tracking.dart';
import 'package:mysite/app/sections/projects/projects.dart';
import 'package:mysite/core/animations/entrance_fader.dart';
import 'package:mysite/core/color/colors.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/providers/scroll_provider.dart';
import 'package:provider/provider.dart';

class NavBarActionButton extends StatefulWidget {
  final String label;
  final int index;

  const NavBarActionButton({
    super.key,
    required this.label,
    required this.index,
  });

  @override
  State<NavBarActionButton> createState() => _NavBarActionButtonState();
}

class _NavBarActionButtonState extends State<NavBarActionButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);
    final width = MediaQuery.of(context).size.width;
    // theme
    var theme = Theme.of(context);
    
    // Dynamic horizontal padding for the labels
    double horizontalLabelPadding = width < 1200 ? 10 : 20;

    return EntranceFader(
      offset: const Offset(0, -10),
      delay: const Duration(milliseconds: 1000),
      duration: const Duration(milliseconds: 250),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          gradient: isHover ? pinkpurple : null,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: InkWell(
          onHover: (value) {
            setState(() => isHover = value);
          },
          onTap: () {
            if (widget.index == 5) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const Projects()));
              return;
            }
            scrollProvider.jumpTo(widget.index);
            AnalyticsTracking.mostCheckedOutSection(section: widget.label);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalLabelPadding, vertical: 10),
            child: Text(
              widget.label,
              style: TextStyle(color: theme.textColor),
            ),
          ),
        ),
      ),
    );
  }
}
