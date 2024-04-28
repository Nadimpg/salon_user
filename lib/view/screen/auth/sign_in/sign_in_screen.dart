
import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/utils/api_static_string.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_icons.dart';
import 'package:barber_user_app/view/screen/auth/sign_in/sign_in_controller/sign_in_controller.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/button/custom_button.dart';
import 'package:barber_user_app/view/widgets/custom_loader/custom_loader.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/custom_textfield/custom_textfield.dart';
import 'package:barber_user_app/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(
            appBarContent: CustomBack(text: "Sign In".tr, isIcon: false)),
        body: GetBuilder<SignInController>(
          builder: (controller) {
            return SingleChildScrollView(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //=================================Email===========================
                    CustomText(
                        text: "Email".tr,
                        textAlign: TextAlign.start,
                        bottom: 12,
                        top: 24),
                    CustomTextField(
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
                      textEditingController: controller.emailController,
                      hintText: "Enter email".tr,
                      fillColor: AppColors.stroke,
                    ),

                    //=================================Password===========================
                    CustomText(
                        text: "Password".tr,
                        textAlign: TextAlign.start,
                        top: 16,
                        bottom: 12),
                    CustomTextField(

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
                      textEditingController: controller.passWordController,
                      hintText: "Enter password".tr,
                      isPassword: true,
                      fillColor: AppColors.stroke,
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoute.forgetPassScreen,arguments: false),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: CustomText(
                          text: "Forgot Password?".tr,
                          color: AppColors.primaryOrange,
                        ),
                      ),
                    ),
                    const SizedBox(height: 44),

                    ///=================================Sign In Button===========================
                    controller.signInLoading
                        ? const CustomLoader()
                        : CustomButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            controller.signInUser();
                          }
                          // controller.signInUser();
                        },
                        titleText: "Sign In".tr),
                    Align(
                      alignment: Alignment.center,
                      child: CustomText(
                          top: 24, bottom: 16, text: "Or Sign in with".tr),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ///=================================Sign In Google===========================

                        GestureDetector(
                          onTap: () {
                            controller.signInWithGoogle();
                          },
                          child: Container(
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
                        ),
                        const SizedBox(width: 16),
                        ///=================================Sign In FaceBook===========================

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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0, top: 40),
                      child: GestureDetector(
                        onTap: () => Get.toNamed(AppRoute.signUpScreen),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(text: "Don’t have an account?  ".tr),
                            CustomText(
                                text: "Sign Up".tr,
                                color: AppColors.primaryOrange),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
