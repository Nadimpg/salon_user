import 'dart:async';
import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/utils/app_icons.dart';
import 'package:barber_user_app/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void navigate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? isOnboarding = preferences.getBool(AppConstants.onBoard);

    print("isOnboarding=======================$isOnboarding");

    Future.delayed(const Duration(seconds: 2), () {
      if (isOnboarding == true || isOnboarding == null) {
        Get.offAllNamed(AppRoute.onboardingScreen);
      } else {
        Get.offAllNamed(AppRoute.signInScreen);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    navigate();
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Timer(const Duration(seconds: 3),(){
  //     //Navigator.pushNamed(context, AppRoute.onboardingScreen);
  //     Get.offAllNamed(AppRoute.onboardingScreen);
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) =>
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImage(imageSrc: AppIcons.appIcon),
              ],
            ),
          ),
        ),
      ),
    );
  }
}