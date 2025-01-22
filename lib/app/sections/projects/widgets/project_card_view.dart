import 'package:flutter/material.dart';
import 'package:mysite/app/sections/projects/model/project_model.dart';
import 'package:mysite/core/color/colors.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/res/responsive.dart';
import 'package:sizer/sizer.dart';

/// This Dart class represents a project card view in a Flutter application.
class ProjectCardView extends StatefulWidget {
  const ProjectCardView({
    super.key,
    required this.data,
  });
  final ProjectModel data;

  @override
  State<ProjectCardView> createState() => _ProjectCardViewState();
}

class _ProjectCardViewState extends State<ProjectCardView> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => {},
      onHover: (isHovering) {
        if (isHovering) {
          setState(() => isHover = true);
        } else {
          setState(() => isHover = false);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 1.w),
        width: Responsive.isDesktop(context) ? 30.w : 70.w,
        height: 36.h,
        decoration: BoxDecoration(
          gradient: isHover ? pinkpurple : grayBack,
          borderRadius: BorderRadius.circular(10),
          boxShadow: isHover ? [primaryColorShadow] : [blackColorShadow],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.data.pName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isHover ? whiteColor : theme.textColor,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              widget.data.pName,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: isHover ? whiteColor : theme.textColor,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
