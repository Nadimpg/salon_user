import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/helper/prefs_helper.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/view/screen/home/home_controller/home_controller.dart';
import 'package:barber_user_app/view/widgets/button/custom_button.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogOutPopUp extends StatelessWidget {
  const LogOutPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.only(top: 28,bottom: 54),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.cardBgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            CustomText(text: "Log out".tr,fontSize: 18,fontWeight: FontWeight.w600),
            const Padding(padding: EdgeInsets.symmetric(vertical: 24),
              child: Divider(height: 1,color: AppColors.stroke,thickness: 1),
            ),
            CustomText(text: "Are you sure you want to log out?".tr,fontWeight: FontWeight.w500,maxLines: 2,bottom: 36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(child: CustomButton(titleText: "Cancel".tr,buttonColor: AppColors.stroke,onPressed: () => Get.back(),),),
                  const SizedBox(width: 16),
                 // Expanded(child: CustomButton(titleText: "Confirm".tr,onPressed: () => Get.offAllNamed(AppRoute.signInScreen),),),
                  Expanded(
                    child: CustomButton(
                      titleText: "Confirm".tr,
                      onPressed: () {
                        //   logout();
                        PrefsHelper.setBool(
                            AppConstants.paymentDone, false);

                        PrefsHelper.setBool(
                            AppConstants.isProviderAdded, false);

                        PrefsHelper.remove(AppConstants.bearerToken);

                        GoogleSignIn().signOut();

                        if (Get.isRegistered<HomeController>()) {
                          HomeController homeController =
                          Get.find<HomeController>();
                          homeController.dispose();
                        }

                        Get.offAllNamed(AppRoute.signInScreen);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
