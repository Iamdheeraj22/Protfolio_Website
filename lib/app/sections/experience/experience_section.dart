import 'package:flutter/material.dart';
import 'package:mysite/app/sections/experience/experience_desktop_view.dart';
import 'package:mysite/app/sections/experience/experience_mobile.dart';
import 'package:mysite/core/res/responsive.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ExperienceMobileTabView(),
      tablet: ExperienceDesktopView(),
      desktop: ExperienceDesktopView(),
      largeMobile: ExperienceMobileTabView(),
      extraLargeScreen: ExperienceDesktopView(),
    );
  }
}
