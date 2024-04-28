import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';

class ProfileCards extends StatelessWidget {
  const ProfileCards({super.key, required this.imageSrc, required this.text, required this.onTap});

  final String imageSrc;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardBgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              height: 36,width: 36,
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle
            ),
            child: CustomImage(imageSrc: imageSrc,imageColor: Colors.black,)),
            CustomText(text: text,fontWeight: FontWeight.w500,left: 16)
          ],
        ),
      ),
    );
  }
}
