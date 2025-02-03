import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mysite/core/color/colors.dart';
import 'package:mysite/core/theme/app_theme.dart';

class SkillView extends StatefulWidget {
  const SkillView({
    super.key,
    required this.title,
    this.isSelected = false,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<SkillView> createState() => _SkillViewState();
}

class _SkillViewState extends State<SkillView> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: widget.onTap,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onHover: (e) {
        setState(() {
          isHover = e;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.isSelected ? darkBackgroundColor : null,
          border: widget.isSelected
              ? null
              : Border.all(
                  color: textColor,
                  width: 1,
                ),
          gradient: isHover ? pinkpurple : /* theme.serviceCard*/ null,
          boxShadow:
              isHover ? [primaryColorShadow] : null /*[blackColorShadow]*/,
        ),
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 16,
            color: isHover || widget.isSelected ? whiteColor : theme.textColor,
            fontWeight: widget.isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
