import 'package:flutter/material.dart';
import 'package:mysite/app/widgets/custom_text_heading.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/configs/others/space.dart';

class ExperienceTagDescriptionView extends StatelessWidget {
  const ExperienceTagDescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSectionHeading(text: 'Experience'),
        Space.y(1)!,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: CustomSectionSubHeading(text: experienceSubHeading),
        ),
      ],
    );
  }
}
