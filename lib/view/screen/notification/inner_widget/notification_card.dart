
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard(
      {super.key,
        required this.imageSrc,
        required this.title,
        required this.subText});

  final String imageSrc;
  final String title;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.stroke),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          CustomImage(imageSrc: imageSrc, size: 56, imageType: ImageType.png),
          const SizedBox(width: 16),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text: title,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    bottom: 8),
                CustomText(
                    text: subText,
                    fontSize: 12,
                    color: AppColors.paragraph,
                    maxLines: 3,
                    textAlign: TextAlign.start
                ),
              /*  CustomText(
                    text: '2024',
                    fontSize: 12,
                    color: AppColors.paragraph,
                    textAlign: TextAlign.start,
                  top: 4,
                )*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}