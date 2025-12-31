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
      child: AnimatedScale(
        scale: isHover || widget.isSelected ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: widget.isSelected ? null : (isHover ? null : Colors.transparent),
            border: Border.all(
              color: widget.isSelected || isHover ? Colors.transparent : theme.textColor.withOpacity(0.5),
              width: 1.5,
            ),
            gradient: widget.isSelected || isHover ? pinkpurple : null,
            boxShadow: isHover || widget.isSelected
                ? [
                    BoxShadow(
                      color: secondaryColor.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ]
                : [],
          ),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              fontSize: 16,
              color: isHover || widget.isSelected ? whiteColor : theme.textColor,
              fontWeight: widget.isSelected || isHover ? FontWeight.bold : FontWeight.w500,
              fontFamily: 'Poppins',
            ),
            child: Text(widget.title),
          ),
        ),
      ),
    );
  }
}
