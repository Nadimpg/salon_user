
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/view/screen/settings/controller/settings_controller.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/custom_loader/custom_loader.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/error/general_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

class AboutUs extends StatelessWidget {
  AboutUs({super.key});
  final SettingsController settingsController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(
          appBarContent: CustomBack(text: "About Us".tr),
        ),
        body: Obx(() {
          switch (settingsController.rxRequestStatus.value) {
            case Status.loading:
              return const CustomLoader();
            case Status.internetError:
              return const CustomLoader();
            case Status.error:
              return GeneralErrorScreen(
                onTap: () {
                  settingsController.aboutPrivacyTerms();
                },
              );

            case Status.completed:
              return settingsController.aboutPrivacyTermsModel.value.data!.isEmpty ? Center(
                child: CustomText(
                  text: 'Empty',
                  fontSize: 16.h,
                  color: Colors.white,
                ),
              ):

                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  physics: const BouncingScrollPhysics(),
                  child: HtmlWidget(
                    settingsController.aboutPrivacyTermsModel.value.data![2].pageDescription.toString(),
                    textStyle: const TextStyle(color: AppColors.white),
                  ));
          }
        }),
      ),
    );
  }
}