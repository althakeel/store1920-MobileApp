import 'package:flutter/cupertino.dart';
import 'package:store1920/screens/features/categories/views/all_categories_screen.dart';
import '../screens/features/auth/controller/loader_controller.dart';
import '../screens/features/home/views/home_screen.dart';

class ConstantValue extends LoaderController {
  static final List<Widget> pages = [
    HomeScreen(),
    AllCategoriesScreen(),
    Container(),
    Container(),
  ];
}
