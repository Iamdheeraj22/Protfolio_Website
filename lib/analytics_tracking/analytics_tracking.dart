import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsTracking {
  static FirebaseAnalytics? analytics;

  //Create singleton
  static final AnalyticsTracking _singleton = AnalyticsTracking._internal();

  factory AnalyticsTracking() {
    return _singleton;
  }

  AnalyticsTracking._internal();

  static init() {
    analytics ??= FirebaseAnalytics.instance;
  }

  static Future<void> mostCheckedOutSection({required String section}) async {
    try {
      if (analytics != null) {
        await analytics!.logEvent(
          name: 'most_checked_out_section',
          parameters: {
            'whichSection': section,
          },
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> mostCheckedOutSkill({required String section}) async {
    try {
      if (analytics != null) {
        await analytics!.logEvent(
          name: 'most_checked_out_skill',
          parameters: {
            'whichSkill': section,
          },
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> mostCheckedOutProject({required String section}) async {
    try {
      if (analytics != null) {
        await analytics!.logEvent(
          name: 'most_checked_out_project',
          parameters: {
            'whichProject': section,
          },
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> logOtherEvent(
      {required String name, required Map<String, Object> section}) async {
    try {
      if (analytics != null) {
        await analytics!.logEvent(name: name, parameters: section);
      }
    } catch (e) {
      rethrow;
    }
  }
}
