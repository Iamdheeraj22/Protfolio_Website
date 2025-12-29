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
          'https://api.github.com/users/Iamdheeraj22/repos?per_page=20&page=$page'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<GithubProjectDataModel> projects =
            data.map((json) => GithubProjectDataModel.fromJson(json)).toList();
        emit(state.copyWith(
            status: ProjectsStateStatus.success,
            projects: projects,
            page: page));
      } else {
        emit(state.copyWith(status: ProjectsStateStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(status: ProjectsStateStatus.failure));
    }
  }
}
