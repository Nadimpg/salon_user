import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_images.dart';
import 'package:barber_user_app/view/widgets/button/custom_button.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  final String bannerImg;
  final bool moreContent;
  final String title1;
  final String ratting;
  final String title2;
  final String km;
  final Widget imageWidget;
  final VoidCallback? onPressed;

  const CustomCard(
      {super.key,
      required this.onPressed,
      required this.title1,
      required this.ratting,
      required this.title2,
      required this.km,
      this.bannerImg = AppImages.salon,
      this.moreContent = false, required this.imageWidget});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * .7,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(right: 16, top: 16),
      decoration: BoxDecoration(
          color: AppColors.cardBgColor, borderRadius: BorderRadius.circular(8)),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CustomImage(imageType: ImageType.png, imageSrc: bannerImg),
          imageWidget,
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: CustomText(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    text: title1,
                    right: 24,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.star,
                        size: 14, color: AppColors.primaryOrange),
                    CustomText(
                      left: 6,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      text: ratting,
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (moreContent)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: CustomText(
                      fontSize: 12,
                      maxLines: 2,
                      right: 24,
                      text: title2,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on_rounded,
                          color: AppColors.primaryOrange, size: 14),
                      CustomText(
                        left: 4,
                        fontSize: 12,
                        text: km,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          if (moreContent)
            CustomButton(
              buttonHeight: 40,
              titleSize: 12,
              onPressed: onPressed,
              titleText: "See Details".tr,
            )
        ],
      ),
    );
  }
}
