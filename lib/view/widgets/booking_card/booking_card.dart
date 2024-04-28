import 'package:barber_user_app/service/network_image.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/view/widgets/button/custom_button.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/row_text/row_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingCard extends StatelessWidget {
  const BookingCard(
      {super.key,
      required this.profileImage,
      required this.profileName,
      required this.value1,
      required this.serviceContent,
      required this.value3,
      this.onTap,
        required this.approved,
      required this.button, this.onPressed, this.buttonColor=AppColors.primaryOrange, required this.businessName});

  final String profileImage;
  final String profileName;
  final String value1;
  final Widget serviceContent;
  final String value3;
  final String button;
  final String businessName;
  final Color buttonColor;
  final String approved;
  final VoidCallback? onTap;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: AppColors.primaryOrange,
                width: 1,
                style: BorderStyle.solid),
            color: AppColors.cardBgColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //Image and Name section
            Row(
              children: [
                CustomNetworkImage(
                  imageUrl:profileImage,
                  height: 40.h,
                  width: 40.w,
                ),
                Flexible(
                  child: CustomText(
                      text: profileName,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      left: 18),
                ),
              ],
            ),

            CustomText(
              text: businessName,
              fontWeight: FontWeight.w500,
              fontSize: 18,
              top: 8.h,
            ),
            const SizedBox(height: 16),
            RowText(field: "Date:".tr, value: value1),
            const SizedBox(height: 12),
            serviceContent,
            const SizedBox(height: 12),
            RowText(field: "Total Amount :".tr, value: "\$ $value3"),
            const SizedBox(height: 16),
            CustomButton(
              buttonColor: buttonColor,

              titleText: button,
              buttonHeight: 44,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
