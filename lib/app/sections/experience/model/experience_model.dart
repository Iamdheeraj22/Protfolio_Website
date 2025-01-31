class ExperienceModel {
  final String jobRole;
  final String jobType;
  final String companyName;
  final String companyLogo;
  final String startDate;
  final String endDate;
  final bool isCurrentJob;
  final List<String> jobDescription;

  ExperienceModel({
    required this.jobRole,
    required this.jobType,
    required this.companyName,
    required this.companyLogo,
    required this.startDate,
    required this.endDate,
    required this.isCurrentJob,
    required this.jobDescription,
  });

  //copyWith method
  ExperienceModel copyWith({
    String? jobRole,
    String? jobType,
    String? companyName,
    String? companyLogo,
    String? startDate,
    String? endDate,
    bool? isCurrentJob,
    List<String>? jobDescription,
  }) {
    return ExperienceModel(
      jobRole: jobRole ?? this.jobRole,
      jobType: jobType ?? this.jobType,
      companyName: companyName ?? this.companyName,
      companyLogo: companyLogo ?? this.companyLogo,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isCurrentJob: isCurrentJob ?? this.isCurrentJob,
      jobDescription: jobDescription ?? this.jobDescription,
    );
  }
}
