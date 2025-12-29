import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:mysite/app/sections/projects/model/github_project_data_model.dart';

part 'projects_state.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  ProjectsCubit() : super(const ProjectsState());

  Future<void> fetchProjects({int page = 1}) async {
    emit(state.copyWith(status: ProjectsStateStatus.loading));
    try {
      final response = await http.get(Uri.parse(
          'https://api.github.com/users/Iamdheeraj22/repos?per_page=${state.pageSize}&page=$page'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<GithubProjectDataModel> projects =
            data.map((json) => GithubProjectDataModel.fromJson(json)).toList();
        emit(state.copyWith(
          status: ProjectsStateStatus.success,
          projects: projects,
          page: page,
        ));
      } else {
        emit(state.copyWith(status: ProjectsStateStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(status: ProjectsStateStatus.failure));
    }
  }

  void setPageSize(int size) {
    if (state.pageSize != size) {
      emit(state.copyWith(pageSize: size));
      fetchProjects(page: 1); // Reset to page 1 for new size
    }
  }

  void setFilters({String? owner, int? minWatchers}) {
    emit(state.copyWith(
      filterOwner: owner,
      filterMinWatchers: minWatchers ?? state.filterMinWatchers,
    ));
  }

  List<GithubProjectDataModel> get filteredProjects {
    return state.projects.where((project) {
      final matchesOwner = state.filterOwner == null ||
          state.filterOwner!.isEmpty ||
          (project.owner?.login
                  ?.toLowerCase()
                  .contains(state.filterOwner!.toLowerCase()) ??
              false);
      final matchesWatchers =
          (project.watchersCount ?? 0) >= state.filterMinWatchers;
      return matchesOwner && matchesWatchers;
    }).toList();
  }
}
