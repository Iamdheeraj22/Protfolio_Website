import 'package:mysite/app/sections/skills/model/skill_child_model.dart';

class SkillModel {
  final String name;
  final bool isSelected;
  final List<SkillChildModel> children;

  SkillModel({
    required this.name,
    required this.isSelected,
    required this.children,
  });
}
