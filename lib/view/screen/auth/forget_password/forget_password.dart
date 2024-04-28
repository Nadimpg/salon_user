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

class ForgetPassword extends StatelessWidget {
    ForgetPassword({super.key});


final  bool isFromSignUp=Get.arguments;
    final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: CustomAppBar(
          appBarContent: CustomBack(text: "Forgot Password".tr)
        ),
        body: GetBuilder<SignUpController>(
          builder: (controller) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 24),
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    CustomText(
                      text: "Please enter your email address for recover your password.".tr,
                      maxLines: 2,overflow: TextOverflow.ellipsis,bottom: 24,
                      textAlign: TextAlign.start,
                    ),

                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: AppColors.primaryOrange,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const CustomImage(
                          imageSrc: AppIcons.forgetPass,
                          imageType: ImageType.png,
                        ),
                      ),
                    ),

                    CustomText(top: 24,bottom: 12, text: "Email".tr),

                    CustomTextField(
                      textEditingController: controller.forgetEmailTextCtrl,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStaticStrings.enteremail;
                        } else if (!AppStaticStrings.emailRegexp
                            .hasMatch(controller.forgetEmailTextCtrl.text)) {
                          return AppStaticStrings.enterValidEmail;
                        } else {
                          return null;
                        }
                      },
                      hintText: "Enter email".tr,
                      fillColor: AppColors.stroke,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                ),
              ),
            );
          }
        ),
        bottomNavigationBar: GetBuilder<SignUpController>(
          builder: (controller) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 24),
              physics: const ClampingScrollPhysics(),
              child:controller.signUpLoading ?const CustomLoader(): CustomButton(
                onPressed: (){
                  if (formKey.currentState!.validate()) {
                    controller.handleForgetPassword();
                    // Get.toNamed(AppRoute.otpScreen,arguments: isFromSignUp);
                  }
                },
                  titleText: "Continue".tr),
            );
          }
        ),
      ),
    );
  }
}
