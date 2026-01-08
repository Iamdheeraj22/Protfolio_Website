import 'package:flutter/material.dart';
import 'package:mysite/app/sections/experience/model/experience_utils.dart';
import 'package:mysite/app/sections/experience/widgets/experience_tag_description_view.dart';
import 'package:mysite/app/sections/experience/widgets/experience_view.dart';

class ExperienceDesktopView extends StatefulWidget {
  const ExperienceDesktopView({super.key});

  @override
  State<ExperienceDesktopView> createState() => _ExperienceDesktopViewState();
}

class _ExperienceDesktopViewState extends State<ExperienceDesktopView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ExperienceTagDescriptionView(),
        SizedBox(
          height: 2.5,
        ),
        Container(
          constraints:
              BoxConstraints(minWidth: width / 4, maxWidth: width / 1.3),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ExperienceUtils().experiences.length,
            itemBuilder: (ctx, index) {
              final model = ExperienceUtils().experiences[index];
              return ExperienceView(
                model: model,
              );
            },
          ),
        )
      ],
    );
  }
}
