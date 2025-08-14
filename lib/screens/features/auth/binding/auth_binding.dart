import 'package:get/get.dart';
import '../controller/loader_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put<UserController>(UserController(), permanent: true);
    Get.put<LoaderController>(LoaderController(), permanent: true);
  }
}
