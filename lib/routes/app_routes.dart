import 'package:get/get.dart';

class AppRoutes {
  // Route names
  static const String splash = '/splash';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String surveyQuestions = '/survey-questions';
  static const String cementSurveyQuestions = '/cement-survey-questions';
  static const String awardSurveyQuestions = '/award-survey-questions';
  static const String sarpanchForm = '/sarpanch-form';
  static const String photosSection = '/photos_section';
  static const String connectivityTest = '/connectivity-test';
  static const String advancedSyncTest = '/advanced-sync-test';
  static const String syncCenter = '/sync-center';

  // Route pages
  static final List<GetPage> pages = [
    // GetPage(name: splash, page: () => SplashScreen(), binding: AuthBinding()),
    // GetPage(name: login, page: () => LoginScreen(), binding: AuthBinding()),
  ];
}
