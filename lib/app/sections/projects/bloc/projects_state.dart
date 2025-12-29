part of 'projects_cubit.dart';

final class ProjectsState extends Equatable {
  final int page;
  final ProjectsStateStatus status;
  final int pageSize;
  final String? filterOwner;
  final int filterMinWatchers;
  final List<GithubProjectDataModel> projects;

  const ProjectsState({
    this.status = ProjectsStateStatus.initial,
    this.projects = const [],
    this.page = 1,
    this.pageSize = 20,
    this.filterOwner,
    this.filterMinWatchers = 0,
  });

  ProjectsState copyWith({
    ProjectsStateStatus? status,
    List<GithubProjectDataModel>? projects,
    int? page,
    int? pageSize,
    String? filterOwner,
    int? filterMinWatchers,
  }) {
    return ProjectsState(
      status: status ?? this.status,
      projects: projects ?? this.projects,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      filterOwner: filterOwner ?? this.filterOwner,
      filterMinWatchers: filterMinWatchers ?? this.filterMinWatchers,
    );
  }

  @override
  List<Object?> get props => [
        projects,
        status,
        page,
        pageSize,
        filterOwner,
        filterMinWatchers,
      ];
}

enum ProjectsStateStatus { initial, loading, success, failure }
