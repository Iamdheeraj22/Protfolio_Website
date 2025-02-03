class SkillImages {
  //Singleton
  static final SkillImages _instance = SkillImages._internal();

  factory SkillImages() => _instance;

  SkillImages._internal();

  static const String _path = 'assets/skills';

  static const String flutter = '$_path/flutter.svg';
  static const String dart = '$_path/dart.svg';
  static const String firebase = '$_path/firebase.svg';
  static const String git = '$_path/github.svg';
  static const String postman = '$_path/postman.svg';
  static const String supabase = '$_path/supbase.svg';
  static const String flutterFlow = '$_path/flutter_flow.svg';
  static const String googleCloud = '$_path/googleCloud.svg';
  static const String restFulApi = '$_path/restful_api.svg';
  static const String sql = '$_path/sql.svg';
  static const String vsCode = '$_path/vscode.svg';
  static const String trello = '$_path/trello.svg';
  static const String android = '$_path/android.svg';
  static const String androidStudio = '$_path/android_studio.svg';
  static const String xcode = '$_path/xcode.svg';
}
