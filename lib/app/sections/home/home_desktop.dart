import 'package:flutter/material.dart';
import 'package:mysite/app/sections/home/home_section_responsive_view.dart';
import 'package:mysite/core/configs/configs.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UI.vertical! * 80,
      child: const HomeSectionResponsiveView(),
    );
  }
}
