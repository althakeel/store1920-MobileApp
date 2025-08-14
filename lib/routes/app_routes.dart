import 'package:get/get.dart';
import 'package:store1920/screens/features/home/views/home_screen.dart';
import '../screens/features/auth/views/splash_screen.dart';

class AppRoutes {
  // Route names
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';

  // Route pages
  static final List<GetPage> pages = [
    GetPage(name: splash, page: () => SplashScreen()),
    // GetPage(name: login, page: () => LoginScreen(), binding: AuthBinding()),
    GetPage(name: home, page: () => HomeScreen()),
  ];
}
