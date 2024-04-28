import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/di_service/dependency_injection.dart';

void main() async{
  Dependancy dI = Dependancy();
  dI.dependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 966),
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            defaultTransition: Transition.noTransition,
            transitionDuration: const Duration(milliseconds: 200),
            initialRoute: AppRoute.splashscreen,
            navigatorKey: Get.key,
            getPages: AppRoute.routes,
          );
        });
  }
}