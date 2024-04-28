
import 'package:barber_user_app/utils/api_static_string.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/view/screen/settings/controller/settings_controller.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/button/custom_button.dart';
import 'package:barber_user_app/view/widgets/custom_loader/custom_loader.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/custom_textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(
          appBarContent: CustomBack(text: "Change Password".tr),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: GetBuilder<SettingsController>(builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //===================================Current Password==============================

                CustomText(text: "Current Password".tr, bottom: 12),
                CustomTextField(
                    textEditingController: controller.currentPassController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppStaticStrings.fieldCantBeEmpty;
                      } else if (value.length < 8) {
                        return AppStaticStrings.passwordLength;
                      } else if (!AppStaticStrings.passRegExp.hasMatch(value)) {
                        return AppStaticStrings.passMustContainBoth;
                      } else {
                        return null;
                      }
                    },
                    hintText: "Enter password".tr,
                    isPassword: true),

                //===================================New Password==============================

                CustomText(text: "New Password".tr, top: 16, bottom: 12),
                CustomTextField(
                    textEditingController: controller.newPassController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppStaticStrings.fieldCantBeEmpty;
                      } else if (value.length < 8) {
                        return AppStaticStrings.passwordLength;
                      } else if (!AppStaticStrings.passRegExp.hasMatch(value)) {
                        return AppStaticStrings.passMustContainBoth;
                      } else {
                        return null;
                      }
                    },
                    hintText: "New Password".tr,
                    isPassword: true),

                //===================================Confirm Password==============================

                CustomText(text: "Confirm Password".tr, top: 16, bottom: 12),
                CustomTextField(
                    textEditingController: controller.confirmPassController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppStaticStrings.fieldCantBeEmpty;
                      } else if (controller.newPassController.text !=
                          controller.confirmPassController.text) {
                        return AppStaticStrings.passDoesNotMatch;
                      } else {
                        return null;
                      }
                    },
                    hintText: "Confirm Password".tr,
                    isPassword: true),
              ],
            );
          }),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: GetBuilder<SettingsController>(builder: (controller) {
            return controller.loading
                ? const CustomLoader()
                : CustomButton(
              titleText: "Update Password".tr,
              onPressed: () {
                controller.changePass();
              },
            );
          }),
        ),
      ),
    );
  }
}