import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.imageWidget,
    required this.name,
    required this.description,
    required this.month,
    required this.userRating,   this.number,
  });
  final Widget imageWidget;
  final String name;
  final int ?number;
  final String month;
  final double userRating;
  // final double rating;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: '${number.toString()}.',
          bottom: 8.h,
        ),
        Row(
          children: [
            imageWidget,
            const SizedBox(
              width: 8,
            ),
            Flexible(
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomText(
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            text: name,
                            fontWeight: FontWeight.w600,
                            bottom: 4,
                          ),
                        ),
                        Flexible(
                          child: CustomText(
                              maxLines: 2,
                              text: month, fontSize: 14, left: 24),
                        ),
                      ],
                    ),
                    RatingBar.builder(
                      itemSize: 16,
                      initialRating: userRating,
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
                        print(rating);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        CustomText(
          text: description,
          fontSize: 14,
          textAlign: TextAlign.start,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          top: 12,
        ),
        const SizedBox(
          height: 24,
        )
      ],
    );
  }
}
