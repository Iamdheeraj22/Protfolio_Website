import 'package:flutter/material.dart';
import 'package:mysite/app/sections/projects/model/project_model.dart';
import 'package:mysite/core/color/colors.dart';
import 'package:mysite/core/res/responsive.dart';
import 'package:mysite/core/util/constants.dart';

class ProjectInfo extends StatefulWidget {
  const ProjectInfo({super.key, required this.index});

  final int index;

  @override
  State<ProjectInfo> createState() => _ProjectInfoState();
}

class _ProjectInfoState extends State<ProjectInfo> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return InkWell(
      onHover: (value) {
        if (value) {
          isHover = true;
        } else {
          isHover = false;
        }
        setState(() {});
      },
      borderRadius: BorderRadius.circular(30),
      child: AnimatedContainer(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: lightgrayColor,
            boxShadow: [
              if (isHover)
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                )
            ],
          ),
          duration: const Duration(milliseconds: 500),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  projects[widget.index].projectName,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Responsive.isMobile(context)
                  ? const SizedBox(
                      height: 20 / 2,
                    )
                  : const SizedBox(
                      height: 20,
                    ),
              Text(
                projects[widget.index].projectDescription,
                style: const TextStyle(color: Colors.white, height: 1.5),
                maxLines: size.width > 700 && size.width < 750
                    ? 3
                    : size.width < 470
                        ? 2
                        : size.width > 600 && size.width < 700
                            ? 6
                            : size.width > 900 && size.width < 1060
                                ? 6
                                : 4,
                overflow: TextOverflow.ellipsis,
              ),
              InkWell(
                onTap: () {
                  openURL(projects[widget.index].projectLink);
                },
                child: const Text(
                  "Github Link",
                  style: TextStyle(
                    color: Colors.yellowAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
