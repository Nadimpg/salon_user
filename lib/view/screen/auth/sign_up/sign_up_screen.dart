
import 'package:barber_user_app/utils/api_static_string.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_icons.dart';
import 'package:barber_user_app/view/screen/auth/sign_up/sign_up_controller/sign_up_controller.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/button/custom_button.dart';
import 'package:barber_user_app/view/widgets/custom_loader/custom_loader.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/custom_textfield/custom_textfield.dart';
import 'package:barber_user_app/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      extendBody: true,
      //App Bar
      appBar: CustomAppBar(
          appBarContent: CustomBack(text: "Sign Up".tr, isIcon: false)),
      body: GetBuilder<SignUpController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //App Name

                    const Align(
                      alignment: Alignment.center,
                      child: CustomText(
                          text: AppStaticStrings.atyose,
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryOrange)),

                  //Name field

                  CustomText(
                      text: AppStaticStrings.name.tr, bottom: 12, top: 44),

                  CustomTextField(
                    textEditingController: controller.nameController,
                    hintText: AppStaticStrings.enterfullname.tr,
                    fillColor: AppColors.stroke,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStaticStrings.enterfullname;
                      } else {
                        return null;
                      }
                    },
                  ),

                  //Email field

                  CustomText(
                      text: AppStaticStrings.email.tr, top: 16, bottom: 12),

                  CustomTextField(
                    textEditingController: controller.emailController,
                    hintText: AppStaticStrings.enteremail.tr,
                    fillColor: AppColors.stroke,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStaticStrings.enteremail;
                      } else if (!AppStaticStrings.emailRegexp
                          .hasMatch(controller.emailController.text)) {
                        return AppStaticStrings.enterValidEmail;
                      } else {
                        return null;
                      }
                    },
                  ),

                  //Password field

                  CustomText(text: "Password".tr, top: 16, bottom: 12),

                  CustomTextField(
                    textEditingController: controller.passWordController,
                    hintText: "Enter password".tr,
                    isPassword: true,
                    fillColor: AppColors.stroke,
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppStaticStrings.fieldCantBeEmpty;
                      } else if (value.length < 8 ||
                          !AppStaticStrings.passRegExp.hasMatch(value)) {
                        return AppStaticStrings.passwordLengthAndContain;
                      } else {
                        return null;
                      }
                    },
                  ),

                  //Confirm password
                  CustomText(
                      text: "Confirm Password".tr, top: 16, bottom: 12),

                  CustomTextField(
                    textEditingController: controller.confirmPasController,
                    hintText: "Confirm Password".tr,
                    isPassword: true,
                    fillColor: AppColors.stroke,
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppStaticStrings.fieldCantBeEmpty;
                      } else if (controller.passWordController.text !=
                          controller.confirmPasController.text) {
                        return AppStaticStrings.passDoesNotMatch;
                      } else {
                        return null;
                      }
                    },
                  ),

                  //Sign Up Button

                  const SizedBox(height: 44),
                  controller.signUpLoading
                      ? const CustomLoader()
                      : CustomButton(
                      onPressed: () {
                        // Get.toNamed(AppRoute.signUpContinue);
                        // contriller.signUpUser();

                        if (formKey.currentState!.validate()) {
                          controller.signUpUser();
                        }
                      },
                      titleText: AppStaticStrings.conTiNue.tr),

                  // Or Sign in with

                  Align(
                      alignment: Alignment.center,
                      child: CustomText(
                          text: "Or Sign in with".tr, top: 24, bottom: 16)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Google Button

                      Container(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.cardBgColor,
                        ),
                        child: const Center(
                          child: CustomImage(imageSrc: AppIcons.google),
                        ),
                      ),
                      const SizedBox(width: 16),

                      //Facebook Button

                      Container(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.cardBgColor,
                        ),
                        child: const Center(
                          child: CustomImage(imageSrc: AppIcons.facebook),
                        ),
                      ),
                    ],
                  ),

                  //Sign in button

                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0, top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(text: "Already have an account?  ".tr),
                        GestureDetector(
                          onTap: () => Get.back(),
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
          );
        },
      ),
    );
  }
}
