import 'package:flutter/material.dart';
import 'package:mysite/app/sections/skills/controller/skill_controller.dart';
import 'package:mysite/app/sections/skills/utils/skills_utils.dart';
import 'package:mysite/app/sections/skills/widgets/skill_child_view.dart';
import 'package:mysite/app/sections/skills/widgets/skill_view.dart';
import 'package:mysite/app/widgets/custom_text_heading.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/configs/others/space.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Consumer<SkillController>(builder: (ctx, value, child) {
      return Column(
        children: [
          const CustomSectionHeading(text: 'Skills'),
          SizedBox(
            height: 10,
          ),
          Container(
            constraints:
                BoxConstraints(minWidth: width / 4, maxWidth: width / 1.2),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: SkillsUtils().skills.map((e) {
                final index = SkillsUtils().skills.indexOf(e);
                return SkillView(
                  title: e.name,
                  isSelected: index == value.selectedSkillIndex,
                  onTap: () {
                    value.selectSkill(index);
                  },
                );
              }).toList(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.025),
            constraints:
                BoxConstraints(minWidth: width / 4, maxWidth: width / 1.2),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: value.skillChild.map((e) {
                return SkillChildView(
                  data: e,
                  onTap: () {},
                );
              }).toList(),
            ),
          )
        ],
      );
    });
  }
}
