import 'package:flutter/material.dart';
import 'package:mysite/app/sections/contact/contact.dart';
import 'package:mysite/app/sections/experience/experience_section.dart';
import 'package:mysite/app/sections/home/home_section_responsive_view.dart';
import 'package:mysite/app/sections/services/services.dart';
import 'package:mysite/app/sections/skills/skills.dart';

class BodyUtils {
  static final List<Widget> views = [
    const HomeSectionResponsiveView(),
    const Services(),
    const Skills(),
    const ExperienceSection(),
    const Contact(),
  ];
}
