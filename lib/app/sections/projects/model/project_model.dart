class ProjectModel {
  final String pName;
  final bool isPersonal;
  final List<String> techStacks;
  final String? playStore;
  final String? appleStore;
  final String? github;

  ProjectModel({
    required this.pName,
    required this.isPersonal,
    required this.techStacks,
    this.github,
    this.playStore,
    this.appleStore,
  });
}

List<ProjectModel> projects = [
  ProjectModel(
    pName: 'Montra',
    isPersonal: false,
    techStacks: [
      'Flutter',
      'Dart',
      'Firebase',
      'Aws Code Commit',
      'Api Integration'
    ],
  ),
  ProjectModel(
    pName: 'Montra',
    isPersonal: false,
    techStacks: [
      'Flutter',
      'Dart',
      'Firebase',
      'Aws Code Commit',
      'Api Integration'
    ],
  ),
  ProjectModel(
    pName: 'Montra',
    isPersonal: false,
    techStacks: [
      'Flutter',
      'Dart',
      'Firebase',
      'Aws Code Commit',
      'Api Integration'
    ],
  )
];
