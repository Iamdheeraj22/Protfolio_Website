import 'package:flutter/material.dart';
import 'package:mysite/app/sections/experience/model/experience_utils.dart';
import 'package:mysite/app/sections/experience/widgets/experience_tag_description_view.dart';
import 'package:mysite/app/sections/experience/widgets/experience_view.dart';
import 'package:mysite/app/widgets/custom_text_heading.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/configs/others/space.dart';
import 'package:mysite/core/res/responsive_size.dart';
import 'package:sizer/sizer.dart';

class ExperienceMobileTabView extends StatefulWidget {
  const ExperienceMobileTabView({super.key});

  @override
  State<ExperienceMobileTabView> createState() =>
      _ExperienceMobileTabViewState();
}

class _ExperienceMobileTabViewState extends State<ExperienceMobileTabView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExperienceTagDescriptionView(),
        SizedBox(
          height: 2.5.h,
        ),
        ListView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: 3.w,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: ExperienceUtils().experiences.length,
          itemBuilder: (ctx, index) {
            final model = ExperienceUtils().experiences[index];
            return ExperienceView(
              model: model,
            );
          },
        )
      ],
    );
  }
}
