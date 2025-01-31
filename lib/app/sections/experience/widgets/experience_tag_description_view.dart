import 'package:flutter/material.dart';
import 'package:mysite/app/widgets/custom_text_heading.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/configs/others/space.dart';
import 'package:sizer/sizer.dart';

class ExperienceTagDescriptionView extends StatelessWidget {
  const ExperienceTagDescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSectionHeading(text: 'Experience'),
        Space.y(1.w)!,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: CustomSectionSubHeading(text: experienceSubHeading),
        ),
      ],
    );
  }
}
