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
      child: Container(
        width: width * 0.35,
        height: height * 0.15,
        constraints: BoxConstraints(
          maxWidth: 180,
          minWidth: 180,
        ),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        decoration: BoxDecoration(
          gradient: isHover ? pinkpurple : theme.serviceCard,
          borderRadius: BorderRadius.circular(15),
          boxShadow: isHover ? [primaryColorShadow] : [blackColorShadow],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              widget.data.imageUrl,
              width: 50,
              height: 50,
              /* colorFilter: isHover
                  ? ColorFilter.mode(theme.textColor, BlendMode.srcIn)
                  : null,*/
            ),
            SizedBox(height: 10),
            Flexible(
              child: Text(
                softWrap: true,
                widget.data.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: isHover ? whiteColor : theme.textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
