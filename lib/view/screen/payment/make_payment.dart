/*
import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_icons.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/button/custom_button.dart';
import 'package:barber_user_app/view/widgets/common_popup/common_popup.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/custom_textfield/custom_textfield.dart';
import 'package:barber_user_app/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MakePaymentScreen extends StatelessWidget {
  const MakePaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar:
        CustomAppBar(appBarContent: CustomBack(text: "Make payment".tr)),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Card Number
              CustomText(text: "Card Number".tr, bottom: 12),
              CustomTextField(hintText: "Enter card number".tr),

              //Expired Date
              CustomText(text: "Expired Date".tr, bottom: 12, top: 16),
              CustomTextField(hintText: "Enter date".tr),

              //CVV/CVV
              CustomText(text: "CVV/CVV".tr, bottom: 12, top: 16),
              CustomTextField(hintText: "Enter cvv/cvv".tr),

              //Card Holder Name
              CustomText(text: "Card Holder Name".tr, bottom: 12, top: 16),
              CustomTextField(hintText: "Enter card holder".tr),

              //Amount
              CustomText(text: "Amount".tr, bottom: 12, top: 16),
              CustomTextField(hintText: "\$".tr),

              const SizedBox(height: 40),
              CustomButton(
                titleText: "Make Payment".tr,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CommonPopUp(
                        title: "Payment Successful".tr,
                        imageSrc: AppIcons.successfulAppointment,
                        subText: "You have successfully paid for the service.".tr,
                        buttonText: "Back to Home".tr,
                        imageType: ImageType.png,
                        onPressed: () => Get.offAllNamed(AppRoute.navBar),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
