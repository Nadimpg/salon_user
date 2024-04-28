import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class RowText extends StatelessWidget {
  const RowText(
      {super.key, required this.field, required this.value, this.maxLine = 1,this.color = AppColors.white,this.onTap,this.fontSize=14});

  final String field;
  final String value;
  final int maxLine;
  final Color color;
  final VoidCallback? onTap;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: field, fontSize: fontSize, color: AppColors.paragraph),
        Flexible(
          child: GestureDetector(
            onTap: onTap,
            child: CustomText(
              text: value,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              left: 24,
              color: color,
              maxLines: maxLine,
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ],
    );
  }
}
