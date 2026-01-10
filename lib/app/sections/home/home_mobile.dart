import 'package:flutter/material.dart';
import 'package:mysite/app/sections/home/home_section_responsive_view.dart';
import 'package:mysite/core/configs/configs.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UI.vertical! * 60,
      child: const HomeSectionResponsiveView(),
    );
  }
}
