import 'package:flutter/cupertino.dart';
import 'package:mysite/app/sections/skills/model/skill_child_model.dart';
import 'package:mysite/app/sections/skills/utils/skills_utils.dart';

class SkillController extends ChangeNotifier {
  int selectedSkillIndex = 0;
  List<SkillChildModel> skillChild = [];

  void selectSkill(int index) {
    selectedSkillIndex = index;
    notifyListeners();
    setSkillChild(SkillsUtils().skills[index].children);
  }

  void setSkillChild(List<SkillChildModel> list) {
    skillChild.clear();
    skillChild.addAll(list);
    notifyListeners();
  }
}
