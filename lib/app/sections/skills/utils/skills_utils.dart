import 'package:mysite/app/sections/skills/model/skill_child_model.dart';
import 'package:mysite/app/sections/skills/model/skill_model.dart';
import 'package:mysite/changes/skill_images.dart';

class SkillsUtils {
  // Singleton
  static final SkillsUtils _instance = SkillsUtils._internal();

  factory SkillsUtils() => _instance;

  SkillsUtils._internal();

  List<SkillModel> skills = [
    SkillModel(
      name: 'App Development',
      isSelected: false,
      children: [
        SkillChildModel(
          imageUrl: SkillImages.flutter,
          title: 'Flutter',
          url: 'https://flutter.dev/',
        ),
        SkillChildModel(
          imageUrl: SkillImages.dart,
          title: 'Dart',
          url: 'https://dart.dev/',
        ),
        SkillChildModel(
          imageUrl: SkillImages.android,
          title: 'Android Native',
          url: 'https://developer.android.com/',
        ),
        SkillChildModel(
          imageUrl: SkillImages.flutterFlow,
          title: 'FlutterFlow',
          url: 'https://flutterflow.io/',
        ),
      ],
    ),
    SkillModel(name: 'Development Tools', isSelected: false, children: [
      SkillChildModel(
        imageUrl: SkillImages.androidStudio,
        title: 'Android Studio',
        url: 'https://developer.android.com/studio',
      ),
      SkillChildModel(
        imageUrl: SkillImages.vsCode,
        title: 'Vs Code',
        url: 'https://code.visualstudio.com/',
      ),
      SkillChildModel(
        imageUrl: SkillImages.xcode,
        title: 'Xcode',
        url: 'https://developer.apple.com/xcode/',
      ),
    ]),
    SkillModel(name: 'Backend & Database', isSelected: false, children: [
      SkillChildModel(
        imageUrl: SkillImages.firebase,
        title: 'Firebase Database',
        url: 'https://firebase.google.com/',
      ),
      SkillChildModel(
        imageUrl: SkillImages.restFulApi,
        title: 'RESTful API',
        url: 'https://restfulapi.net/',
      ),
      SkillChildModel(
        imageUrl: SkillImages.sql,
        title: 'SQLite',
        url: 'https://www.sqlite.org/',
      ),
      SkillChildModel(
        imageUrl: SkillImages.supabase,
        title: 'Supabase',
        url: 'https://supabase.io/',
      ),
    ]),
    SkillModel(
      name: 'Cloud Services',
      isSelected: false,
      children: [
        SkillChildModel(
          imageUrl: SkillImages.googleCloud,
          title: 'Google Cloud Services',
          url: 'https://cloud.google.com/',
        ),
        SkillChildModel(
          imageUrl: SkillImages.firebase,
          title: 'Firebase Authentication & Cloud Functions',
          url: 'https://firebase.google.com/',
        ),
        SkillChildModel(
          imageUrl: SkillImages.firebase,
          title: 'Firebase Storage',
          url: 'https://firebase.google.com/',
        ),
      ],
    ),
    SkillModel(
      name: 'Essential Tools',
      isSelected: false,
      children: [
        SkillChildModel(
          imageUrl: SkillImages.git,
          title: 'Git & GitHub',
          url: 'https://github.com/',
        ),
        SkillChildModel(
            imageUrl: SkillImages.postman,
            title: 'Postman',
            url: 'https://www.postman.com/'),
        SkillChildModel(
          imageUrl: SkillImages.trello,
          title: 'Trello',
          url: 'https://trello.com/',
        ),
      ],
    ),
  ];
}
