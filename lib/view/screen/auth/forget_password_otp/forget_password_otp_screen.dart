import 'dart:async';

import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_icons.dart';
import 'package:barber_user_app/view/screen/auth/sign_up/sign_up_controller/sign_up_controller.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/button/custom_button.dart';
import 'package:barber_user_app/view/widgets/custom_loader/custom_loader.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgetPasswordOtpScreen extends StatefulWidget {
  const ForgetPasswordOtpScreen({super.key});

  @override
  State<ForgetPasswordOtpScreen> createState() => _ForgetPasswordOtpScreenState();
}

class _ForgetPasswordOtpScreenState extends State<ForgetPasswordOtpScreen> {
  int _secondsRemaining = 120;
  late Timer _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController pinController = TextEditingController();

    return SafeArea(
      top: true,
      child: GetBuilder<SignUpController>(builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.bgColor,
          appBar: CustomAppBar(appBarContent: CustomBack(text: "OTP".tr)),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24),
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                //=================Text================
                CustomText(
                  text:
                  "Please enter the OTP we have sent you in your email.".tr,
                  bottom: 24,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: AppColors.primaryOrange,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const CustomImage(
                    imageSrc: AppIcons.otp,
                    imageType: ImageType.png,
                  ),
                ),
                const SizedBox(height: 24),

                //======================OTP input field==========
                PinCodeTextField(
                  controller: pinController,
                  keyboardType: TextInputType.number,
                  appContext: (context),
                  // validator: (value) {
                  //   if (value!.length <= 6) {
                  //     return null;
                  //   } else {
                  //     return;
                  //   }
                  // },
                  onCompleted: (value) {
                    controller.otp = value;
                  },
                  autoFocus: true,
                  textStyle: const TextStyle(color: AppColors.white),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 64,
                    fieldWidth: 50,
                    activeFillColor: AppColors.bgColor,
                    selectedFillColor: AppColors.bgColor,
                    inactiveFillColor: AppColors.bgColor,
                    borderWidth: 10,
                    errorBorderColor: AppColors.stroke,
                    selectedColor: AppColors.stroke,
                    activeColor: AppColors.primaryOrange,
                    inactiveColor: AppColors.stroke,
                  ),
                  length: 6,
                  enableActiveFill: true,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                        child: CustomText(
                            text: "Did not get the OTP?".tr,
                            maxLines: 2,
                            textAlign: TextAlign.start)),
                    const SizedBox(width: 24),

                    //====================> Resend OTP Button <=====================
                    GestureDetector(
                      onTap: () {
                        if (_secondsRemaining == 0) {
                          _secondsRemaining = 120;
                          startTimer();
                          controller.resendOTP().then((value) {
                            if (value == false) {
                              setState(() {
                                _timer.cancel();
                                _secondsRemaining = 0;
                              });
                            }
                          });
                        }
                      },
                      child: CustomText(
                          text: _secondsRemaining == 0
                              ? "Resend OTP".tr
                              : "Resend SMS $_secondsRemaining",
                          color: AppColors.primaryOrange,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),

          //////===========================Verify Button=========================
          ///

          bottomNavigationBar: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            physics: const ClampingScrollPhysics(),
            child: controller.signUpLoading
                ? const CustomLoader()
                : CustomButton(
                onPressed: () {
                    controller.forgetOtp();
                },
                titleText: "Verify".tr),
          ),
        );
      }),
    );
  }
}