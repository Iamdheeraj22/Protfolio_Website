import 'package:flutter/material.dart';
import 'package:mysite/analytics_tracking/analytics_tracking.dart';
import 'package:mysite/app/sections/skills/controller/skill_controller.dart';
import 'package:mysite/app/sections/skills/utils/skills_utils.dart';
import 'package:mysite/app/sections/skills/widgets/skill_child_view.dart';
import 'package:mysite/app/sections/skills/widgets/skill_view.dart';
import 'package:mysite/app/widgets/custom_text_heading.dart';
import 'package:provider/provider.dart';

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
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            constraints: BoxConstraints(
              minWidth: width / 4,
              maxWidth: width > 800 ? 800 : width,
            ),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 15,
              runSpacing: 15,
              children: SkillsUtils().skills.asMap().entries.map((entry) {
                final index = entry.key;
                final e = entry.value;
                return SkillView(
                  title: e.name,
                  isSelected: index == value.selectedSkillIndex,
                  onTap: () async {
                    value.selectSkill(index);
                    await AnalyticsTracking.mostCheckedOutSkill(section: e.name);
                  },
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 40),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.0, 0.1),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
              );
            },
            child: Container(
              key: ValueKey<int>(value.selectedSkillIndex),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              constraints: BoxConstraints(
                minWidth: width / 4,
                maxWidth: width > 1100 ? 1100 : width,
              ),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 20,
                children: value.skillChild.map((e) {
                  return SkillChildView(
                    data: e,
                    onTap: () {},
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: height * 0.05),
        ],
      );
    });
  }
}
