import 'package:flutter/material.dart';
import 'package:mysite/analytics_tracking/analytics_tracking.dart';
import 'package:mysite/app/sections/projects/model/github_project_data_model.dart';
import 'package:mysite/core/color/colors.dart';
import 'package:mysite/core/util/constants.dart';

class ProjectInfo extends StatefulWidget {
  const ProjectInfo({super.key, required this.data});

  final GithubProjectDataModel data;

  @override
  State<ProjectInfo> createState() => _ProjectInfoState();
}

class _ProjectInfoState extends State<ProjectInfo> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: InkWell(
        onTap: () async {
          await AnalyticsTracking.mostCheckedOutProject(
              section: widget.data.name ?? "Unknown");
          openURL(widget.data.htmlUrl ?? "");
        },
        borderRadius: BorderRadius.circular(20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: grayBack,
            border: Border.all(
              color: isHover ? primaryColor : Colors.transparent,
              width: 2,
            ),
            boxShadow: [
              if (isHover)
                BoxShadow(
                  color: primaryColor.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                )
              else
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.folder_open_rounded,
                    color: isHover ? secondaryColor : primaryColor,
                    size: 40,
                  ),
                  Icon(
                    Icons.arrow_outward_rounded,
                    color: isHover ? primaryColor : Colors.white54,
                    size: 24,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.name ?? "Untitled",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.data.description ?? "No description available.",
                    style: const TextStyle(color: Colors.white70, height: 1.5),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
