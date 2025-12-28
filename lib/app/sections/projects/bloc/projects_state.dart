part of 'projects_cubit.dart';

final class ProjectsState extends Equatable {
  final ProjectsStateStatus status;
  final List<GithubProjectDataModel> projects;

  const ProjectsState(
      {this.status = ProjectsStateStatus.initial, this.projects = const []});

  ProjectsState copyWith(
      {ProjectsStateStatus? status, List<GithubProjectDataModel>? projects}) {
    return ProjectsState(
        status: status ?? this.status, projects: projects ?? this.projects);
  }

  @override
  List<Object> get props => [
        projects,
        status,
      ];
}

enum ProjectsStateStatus { initial, loading, success, failure }
