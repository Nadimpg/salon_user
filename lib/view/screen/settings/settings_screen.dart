import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_icons.dart';
import 'package:barber_user_app/view/screen/profile/inner_widgets/profile_cards.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(appBarContent: CustomBack(text: "Settings".tr)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              ProfileCards(imageSrc: AppIcons.changePass, text: "Change Password".tr, onTap: (){
                Get.toNamed(AppRoute.changePassword);
              }),
              const SizedBox(height: 16),
              ProfileCards(imageSrc: AppIcons.privacyPolicy, text: "Privacy Policy".tr, onTap: (){
                Get.toNamed(AppRoute.privacyPolicy);
              }),
              const SizedBox(height: 16),
              ProfileCards(imageSrc: AppIcons.terms, text: "Terms & Conditions".tr, onTap: (){
                Get.toNamed(AppRoute.termsCondition);
              }),
              const SizedBox(height: 16),
              ProfileCards(imageSrc: AppIcons.aboutUs, text: "About Us".tr, onTap: (){
                Get.toNamed(AppRoute.aboutUs);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
