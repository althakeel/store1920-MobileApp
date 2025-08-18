import 'package:get/get.dart';
import 'package:store1920/screens/features/home/bindings/home_binding.dart';
import 'package:store1920/screens/features/home/views/home_screen.dart';
import 'package:store1920/screens/features/product/bindings/product_detail_binding.dart';
import 'package:store1920/screens/features/product/views/product_detail_screen.dart';
import '../screens/features/auth/views/splash_screen.dart';
import '../screens/features/categories/bindings/all_categories_binding.dart';
import '../screens/features/categories/views/all_categories_screen.dart';

class AppRoutes {
  // Route names
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String productDetail = '/product-detail';
  static const String allCategories = '/all-categories';

  // Route pages
  static final List<GetPage> pages = [
    GetPage(name: splash, page: () => SplashScreen()),
    // GetPage(name: login, page: () => LoginScreen(), binding: AuthBinding()),
    GetPage(name: home, page: () => HomeScreen(), binding: HomeBinding()),
    GetPage(
      name: productDetail,
      page: () => ProductDetailScreen(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: allCategories,
      page: () => AllCategoriesScreen(),
      binding: AllCategoriesBinding(),
    ),
  ];
}
