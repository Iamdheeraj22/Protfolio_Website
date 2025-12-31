import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mysite/app/sections/skills/model/skill_child_model.dart';
import 'package:mysite/core/color/colors.dart';
import 'package:mysite/core/theme/app_theme.dart';
import 'package:mysite/core/util/constants.dart';

class SkillChildView extends StatefulWidget {
  const SkillChildView({
    super.key,
    required this.data,
    required this.onTap,
  });

  final SkillChildModel data;
  final VoidCallback onTap;

  @override
  State<SkillChildView> createState() => _SkillChildViewState();
}

class _SkillChildViewState extends State<SkillChildView> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        openURL(widget.data.url);
      },
      onHover: (e) {
        setState(() {
          isHover = e;
        });
      },
      child: AnimatedScale(
        scale: isHover ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: width * 0.35,
          height: height * 0.15,
          constraints: const BoxConstraints(
            maxWidth: 180,
            minWidth: 160,
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          decoration: BoxDecoration(
            gradient: isHover ? pinkpurple : theme.serviceCard,
            borderRadius: BorderRadius.circular(20),
            boxShadow: isHover
                ? [
                    BoxShadow(
                      color: secondaryColor.withOpacity(0.4),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    )
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ],
            border: Border.all(
              color: isHover ? Colors.transparent : theme.textColor.withOpacity(0.1),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: AnimatedRotation(
                  turns: isHover ? 1.0 / 36.0 : 0, // Slight tilt on hover
                  duration: const Duration(milliseconds: 300),
                  child: SvgPicture.asset(
                    widget.data.imageUrl,
                    width: 45,
                    height: 45,
                    placeholderBuilder: (context) => const SizedBox(
                      width: 45,
                      height: 45,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isHover ? FontWeight.bold : FontWeight.w500,
                  color: isHover ? whiteColor : theme.textColor,
                  fontFamily: 'Poppins',
                ),
                child: Text(
                  widget.data.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
