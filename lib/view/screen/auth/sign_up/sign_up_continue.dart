/*import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_icons.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/button/custom_button.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/custom_textfield/custom_textfield.dart';
import 'package:barber_user_app/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpContinue extends StatelessWidget {
  const SignUpContinue({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(appBarContent: CustomBack(text: "Sign Up".tr)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Align(
                  alignment: Alignment.center,
                  child: CustomText(
                      text: "Atyose",
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryOrange)),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 44, bottom: 16),
                      height: 144,
                      width: 144,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColors.primaryOrange, width: 1)),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.cardBgColor,
                        ),
                        child: const Icon(Icons.camera_alt_outlined,
                            size: 64, color: AppColors.primaryOrange),
                      ),
                    ),
                    CustomText(
                        text: "Upload Picture".tr,
                        fontSize: 18,
                        color: AppColors.primaryOrange,
                        fontWeight: FontWeight.w600)
                  ],
                ),
              ),
              CustomText(text: "Phone Number".tr, top: 24, bottom: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                        color: AppColors.cardBgColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Row(
                      children: [
                        CustomImage(
                            imageSrc: AppIcons.flag,
                            imageType: ImageType.png,
                            size: 24),
                        CustomText(
                            text: "+44", color: AppColors.paragraph, left: 10),
                      ],
                    ),
                  ),
                  Expanded(child: CustomTextField(hintText: "Mobile number".tr)),
                ],
              ),
              CustomText(text: "Address".tr, top: 24, bottom: 12),
              CustomTextField(hintText: "Enter address".tr, maxLines: 4),
              const SizedBox(height: 44),
              CustomButton(
                titleText: "Sign Up".tr,
                onPressed: () {
                  Get.offAllNamed(AppRoute.navBar);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0, top: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: "Already have an account?  ".tr),
                    GestureDetector(
                      onTap: ()=> Get.back(),
                      child: CustomText(
                          text: "Sign In".tr,
                          color: AppColors.primaryOrange),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/


import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_icons.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/button/custom_button.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/custom_textfield/custom_textfield.dart';
import 'package:barber_user_app/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpContinue extends StatelessWidget {
  const SignUpContinue({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: const CustomAppBar(appBarContent: CustomBack(text: "Sign Up")),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Align(
                  alignment: Alignment.center,
                  child: CustomText(
                      text: "Atyose",
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryOrange)),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 44, bottom: 16),
                      height: 144,
                      width: 144,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColors.primaryOrange, width: 1)),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.cardBgColor,
                        ),
                        child: const Icon(Icons.camera_alt_outlined,
                            size: 64, color: AppColors.primaryOrange),
                      ),
                    ),
                    CustomText(
                        text: "Upload Picture".tr,
                        fontSize: 18,
                        color: AppColors.primaryOrange,
                        fontWeight: FontWeight.w600)
                  ],
                ),
              ),
              CustomText(text: "Phone Number".tr, top: 24, bottom: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                        color: AppColors.cardBgColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Row(
                      children: [
                        CustomImage(
                            imageSrc: AppIcons.flag,
                            imageType: ImageType.png,
                            size: 24),
                        CustomText(
                            text: "+44", color: AppColors.paragraph, left: 10),
                      ],
                    ),
                  ),
                  const Expanded(
                      child: CustomTextField(hintText: "Mobile number")),
                ],
              ),
              CustomText(text: "Address".tr, top: 24, bottom: 12),
              CustomTextField(hintText: "Enter address".tr, maxLines: 4),
              const SizedBox(height: 44),
              CustomButton(
                titleText: "Sign Up".tr,
                onPressed: () {
                  Get.toNamed(AppRoute.otpScreen);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0, top: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: "Already have an account?  ".tr),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: CustomText(
                          text: "Sign In".tr, color: AppColors.primaryOrange),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
