import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/view/widgets/button/custom_button.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonPopUp extends StatelessWidget {
  const CommonPopUp(
      {super.key,
      required this.title,
      required this.imageSrc,
      required this.subText,
      required this.buttonText,
      required this.imageType,
      this.onPressed});

  final String title;
  final String imageSrc;
  final String subText;
  final String buttonText;
  final ImageType imageType;
  final VoidCallback ? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.cardBgColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      content: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImage(imageSrc: imageSrc, size: 164, imageType: imageType),
            CustomText(
                text: title.tr,
                fontSize: 20,
                top: 24,
                bottom: 16,
                fontWeight: FontWeight.w600),
            CustomText(
                text: subText.tr,
                fontSize: 14,
                color: AppColors.paragraph,
                maxLines: 2,
                bottom: 24),
            CustomButton(
              titleText: buttonText.tr,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
