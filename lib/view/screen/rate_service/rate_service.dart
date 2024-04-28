import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/view/screen/rate_service/rate_service_controller.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/button/custom_button.dart';
import 'package:barber_user_app/view/widgets/custom_loader/custom_loader.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/custom_textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class RateService extends StatelessWidget {
  RateService({super.key});
  final RateServiceController controller = Get.find<RateServiceController>();
  final serviceID = Get.arguments[0];
  final userId = Get.arguments[1];
  final providerId = Get.arguments[2];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(
          appBarContent: CustomBack(text: "Rate This Service".tr),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "Give a review to this service".tr,
                  fontWeight: FontWeight.w500,
                ),

                RatingBar.builder(

                  maxRating: 5,
                  itemSize: 16,
                  initialRating: 5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: AppColors.primaryOrange,
                  ),
                  onRatingUpdate: (rating) {
                    controller.ratings.value = rating.toInt();
                    print(rating);
                  },
                ),
                CustomText(
                    text: "Write something about this service".tr,
                    fontWeight: FontWeight.w500,
                    top: 44,
                    maxLines: 2,
                    bottom: 16),
                CustomTextField(
                    hintText: "Write here".tr,
                    textEditingController: controller.serviceController,
                    hintFontSize: 14,
                    hintColor: AppColors.paragraph,
                    maxLines: 5),
              ],
            ),
          ),
        ),
        bottomNavigationBar:
            GetBuilder<RateServiceController>(builder: (controller) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            physics: const ClampingScrollPhysics(),
            child:controller.isLoading? CustomLoader(): CustomButton(
                titleText: "Submit".tr,
                onPressed: () {
                  print('rating+++++++++++++++++++${controller.ratings.value}');
                  print(
                      'text+++++++++++++++++++${controller.serviceController.text}');
                  controller.postRating(
                      user_id: userId.toString(),
                      service_id: serviceID.toString(),
                      provider_id: providerId.toString(),
                      rating: controller.ratings.value,
                      review: controller.serviceController.text);
                }),
          );
        }),
      ),
    );
  }
}
