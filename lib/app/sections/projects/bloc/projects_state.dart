part of 'projects_cubit.dart';

final class ProjectsState extends Equatable {
  final ProjectsStateStatus status;
  final int page;
  final List<GithubProjectDataModel> projects;

  const ProjectsState(
      {this.status = ProjectsStateStatus.initial,
      this.projects = const [],
      this.page = 1});

  ProjectsState copyWith(
      {ProjectsStateStatus? status,
      List<GithubProjectDataModel>? projects,
      int? page}) {
    return ProjectsState(
        status: status ?? this.status,
        projects: projects ?? this.projects,
        page: page ?? this.page);
  }

  @override
  List<Object> get props => [
        projects,
        status,
        page,
      ];
}

enum ProjectsStateStatus { initial, loading, success, failure }
