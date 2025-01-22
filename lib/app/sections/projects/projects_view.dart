import 'package:flutter/material.dart';
import 'package:mysite/app/sections/projects/model/project_model.dart';
import 'package:mysite/app/sections/projects/widgets/project_card_view.dart';
import 'package:mysite/app/widgets/custom_text_heading.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/configs/others/space.dart';
import 'package:sizer/sizer.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({super.key});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: size.width / 8,
      ),
      child: Column(
        children: [
          const CustomSectionHeading(text: "\nProjects"),
          Space.y(1.w)!,
          CustomSectionSubHeading(text: protfolioSubHeading),
          Space.y(2.w)!,
          Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            runSpacing: 3.w,
            children: projects
                .asMap()
                .entries
                .map(
                  (e) => ProjectCardView(data: e.value),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
