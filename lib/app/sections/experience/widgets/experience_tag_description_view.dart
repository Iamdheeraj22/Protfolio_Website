import 'package:flutter/material.dart';
import 'package:mysite/app/widgets/custom_text_heading.dart';
import 'package:mysite/changes/strings.dart';

class ExperienceTagDescriptionView extends StatelessWidget {
  const ExperienceTagDescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomSectionHeading(text: 'Experience'),
          CustomSectionSubHeading(text: experienceSubHeading),
        ],
      ),
    );
  }
}
