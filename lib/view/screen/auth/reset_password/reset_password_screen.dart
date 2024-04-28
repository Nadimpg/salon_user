
import 'package:barber_user_app/utils/api_static_string.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/view/screen/auth/sign_up/sign_up_controller/sign_up_controller.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/button/custom_button.dart';
import 'package:barber_user_app/view/widgets/custom_loader/custom_loader.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/custom_textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: CustomAppBar(
            appBarContent: CustomBack(text: "Set A New Password".tr)),
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
                    CustomText(
                        text: "Your password must be 8-10 characters.".tr,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        bottom: 24),

                    // =================================Password=============================

                    CustomText(text: "Password".tr, bottom: 12),
                    CustomTextField(
                      textEditingController: controller.resetPasswordController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return AppStaticStrings.fieldCantBeEmpty;
                        } else if (value.length < 8) {
                          return AppStaticStrings.passwordLength;
                        } else if (!AppStaticStrings.passRegExp
                            .hasMatch(value)) {
                          return AppStaticStrings.passMustContainBoth;
                        } else {
                          return null;
                        }
                      },
                      hintText: "Enter password".tr,
                      fillColor: AppColors.stroke,
                      isPassword: true,
                    ),

                    // =================================Confirm Password=============================

                    CustomText(
                        text: "Confirm Password".tr, top: 16, bottom: 12),
                    CustomTextField(
                      textEditingController: controller.resetConfirmPasswordController,
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
                      hintText: "Confirm Password".tr,
                      fillColor: AppColors.stroke,
                      isPassword: true,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: GetBuilder<SignUpController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: controller.signUpLoading
                ? const CustomLoader()
                : CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    controller.handleResetPassword();
                  }
                  // Get.offAllNamed(AppRoute.signInScreen);
                },
                titleText: "Reset Password".tr),
          );
        }),
      ),
    );
  }
}