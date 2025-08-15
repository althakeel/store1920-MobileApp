import 'package:get/get.dart';
import 'package:store1920/screens/features/auth/controller/loader_controller.dart';

class HomeController extends LoaderController {
  RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
