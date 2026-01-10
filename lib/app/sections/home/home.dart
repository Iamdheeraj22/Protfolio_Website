import 'package:flutter/material.dart';
import 'package:mysite/app/sections/home/home_section_responsive_view.dart';
import 'package:mysite/core/configs/ui.dart';
import 'package:mysite/core/res/responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: HomeSectionResponsiveView(
        height: UI.vertical! * 60,
      ),
      largeMobile: HomeSectionResponsiveView(
        height: UI.vertical! * 60,
      ),
      tablet: HomeSectionResponsiveView(
        height: UI.vertical! * 70,
      ),
      desktop: HomeSectionResponsiveView(
        height: UI.vertical! * 80,
        width: UI.horizontal! * 2,
      ),
    );
  }
}
