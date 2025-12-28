import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysite/app/sections/projects/bloc/projects_cubit.dart';
import 'package:mysite/app/sections/projects/widgets/project_grid.dart';
import 'package:mysite/core/res/responsive.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProjectsCubit()..fetchProjects(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Recent Projects',
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            children: [
              if (Responsive.isLargeMobile(context))
                const SizedBox(
                  height: 20,
                ),
              Text(
                "Here are some of the projects I've worked on.",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.grey,
                    ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Expanded(
                child: Responsive(
                  desktop: ProjectGrid(
                    crossAxisCount: 3,
                  ),
                  extraLargeScreen: ProjectGrid(
                    crossAxisCount: 4,
                  ),
                  largeMobile: ProjectGrid(crossAxisCount: 1, ratio: 1.8),
                  mobile: ProjectGrid(crossAxisCount: 1, ratio: 1.5),
                  tablet: ProjectGrid(
                    ratio: 1.4,
                    crossAxisCount: 2,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
