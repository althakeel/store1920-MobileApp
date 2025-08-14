import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:store1920/screens/features/auth/binding/auth_binding.dart';
import 'routes/app_routes.dart';
import 'services/connectivity_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock orientation to portrait mode only (no rotation)
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await GetStorage.init();
  // Initialize connectivity service BEFORE HTTP service
  Get.put(ConnectivityService(), permanent: true);

  // Initialize HTTP service with base URL (after connectivity service)
  // ApiService.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sarpanch Connect Program',
        theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Roboto'),
        initialRoute: AppRoutes.splash,
        getPages: AppRoutes.pages,
        initialBinding: AuthBinding(),
      ),
    );
  }
}
