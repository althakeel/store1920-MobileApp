import 'package:get/get.dart';
import 'package:store1920/screens/features/home/bindings/home_binding.dart';
import 'package:store1920/screens/features/home/views/home_screen.dart';
import 'package:store1920/screens/features/home/views/navigation_screen.dart';
import 'package:store1920/screens/features/product/bindings/product_binding.dart';
import 'package:store1920/screens/features/product/views/product_detail_screen.dart';
import 'package:store1920/screens/features/product/views/product_list_screen.dart';
import '../screens/features/auth/views/splash_screen.dart';
import '../screens/features/categories/bindings/all_categories_binding.dart';
import '../screens/features/categories/views/all_categories_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String productDetail = '/product-detail';
  static const String productList = '/product-list';
  static const String allCategories = '/all-categories';
  static const String navigation = '/navigation-screen';

  static final List<GetPage> pages = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(
      name: navigation,
      page: () => NavigationScreen(),
      bindings: [HomeBinding(), AllCategoriesBinding()],
    ),
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(
      name: productDetail,
      page: () => ProductDetailScreen(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: productList,
      page: () => ProductListScreen(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: allCategories,
      page: () => AllCategoriesScreen(),
      binding: AllCategoriesBinding(),
    ),
  ];
}
