import 'package:flutter/material.dart';
import 'package:mysite/app/widgets/custom_text_heading.dart';
import 'package:mysite/changes/links.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/util/constants.dart';
import 'package:sizer/sizer.dart';

class PortfolioMobileTab extends StatelessWidget {
  const PortfolioMobileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomSectionHeading(text: "\nProjects"),
        Space.y(3.w)!,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: CustomSectionSubHeading(text: protfolioSubHeading),
        ),
        Space.y(5.w)!,
        OutlinedButton(
          onPressed: () => openURL(gitHub),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'See More',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    );
  }
}
