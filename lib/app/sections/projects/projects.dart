import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysite/app/sections/projects/bloc/projects_cubit.dart';
import 'package:mysite/app/sections/projects/widgets/project_grid.dart';
import 'package:mysite/app/widgets/github_button.dart';
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
                height: 20,
              ),
              BlocBuilder<ProjectsCubit, ProjectsState>(
                builder: (context, state) {
                  return Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      // Page Size Selector
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<int>(
                            value: state.pageSize,
                            dropdownColor: Colors.black,
                            style: const TextStyle(color: Colors.white),
                            items: [10, 20, 50, 100]
                                .map((size) => DropdownMenuItem(
                                      value: size,
                                      child: Text("Page Size: $size"),
                                    ))
                                .toList(),
                            onChanged: (val) {
                              if (val != null) {
                                context.read<ProjectsCubit>().setPageSize(val);
                              }
                            },
                          ),
                        ),
                      ),
                      // Owner Filter
                      SizedBox(
                        width: 200,
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Filter by Owner",
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon:
                                const Icon(Icons.person, color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.05),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                          ),
                          onChanged: (val) {
                            context
                                .read<ProjectsCubit>()
                                .setFilters(owner: val);
                          },
                        ),
                      ),
                      // Min Watchers Filter
                      SizedBox(
                        width: 200,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Min Watchers",
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: const Icon(Icons.visibility,
                                color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.05),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                          ),
                          onChanged: (val) {
                            final count = int.tryParse(val) ?? 0;
                            context
                                .read<ProjectsCubit>()
                                .setFilters(minWatchers: count);
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 20,
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
                        onPressed: (state.projects.length < state.pageSize)
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
        floatingActionButton: Tooltip(
          message: "View on GitHub",
          child: const GithubButton(
            url: 'https://github.com/Iamdheeraj22',
          ),
        ),
      ),
    );
  }
}
