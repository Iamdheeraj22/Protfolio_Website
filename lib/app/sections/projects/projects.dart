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
              Expanded(
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
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<ProjectsCubit, ProjectsState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (state.page > 1)
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<ProjectsCubit>()
                                .fetchProjects(page: state.page - 1);
                          },
                          child: const Text("Previous",
                              style: TextStyle(color: Colors.white)),
                        ),
                      if (state.page > 1)
                        const SizedBox(
                          width: 20,
                        ),
                      Text(
                        "Page ${state.page}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: ((state.projects.length % 20) != 0)
                            ? null
                            : () {
                                context
                                    .read<ProjectsCubit>()
                                    .fetchProjects(page: state.page + 1);
                              },
                        child: const Text(
                          "Next",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
