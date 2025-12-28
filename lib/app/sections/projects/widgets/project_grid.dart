import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysite/app/sections/projects/bloc/projects_cubit.dart';
import 'package:mysite/app/sections/projects/widgets/project_info.dart';
import 'package:mysite/core/color/colors.dart';

class ProjectGrid extends StatelessWidget {
  final int crossAxisCount;
  final double ratio;

  const ProjectGrid({super.key, this.crossAxisCount = 3, this.ratio = 1.3});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsCubit, ProjectsState>(
      builder: (context, state) {
        if (state.status == ProjectsStateStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == ProjectsStateStatus.failure) {
          return const Center(
            child: Text(
              "Failed to fetch projects",
              style: TextStyle(color: Colors.red),
            ),
          );
        } else if (state.projects.isEmpty) {
          return const Center(
            child: Text(
              "No projects found",
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          itemCount: state.projects.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount, childAspectRatio: ratio),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProjectInfo(data: state.projects[index]),
            );
          },
        );
      },
    );
  }
}
