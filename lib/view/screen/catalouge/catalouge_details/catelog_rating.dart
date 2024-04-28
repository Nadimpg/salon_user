import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/view/screen/category_individual_list/inner_widget/review_card.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CatalogRating extends StatelessWidget {
    CatalogRating({super.key});
 var data=Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(
        appBarContent: CustomBack(text: "Review".tr),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 24.h,horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            if (data.serviceRating!.isNotEmpty)
              CustomText(
                  text: "User Review".tr,
                  fontWeight: FontWeight.w600,
                  top: 24,
                  bottom: 16),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.serviceRating!.length,
                itemBuilder: (context, index) {
                  return ReviewCard(
                    imageWidget: Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "${ApiConstant.baseUrl}${data.serviceRating![index].user?.image}")),
                          borderRadius: BorderRadius.circular(12)),

                    ),
                    name: data.serviceRating![index].user!.name.toString()
                        .toString(),
                    description:
                    data.serviceRating![index].review.toString(),
                    month:'12',
                    userRating: data.serviceRating![index].rating!.toDouble(),
                    // DateConverter.dateAndMonth(data.createdAt.toString())
                  );
                }),
          ],
        ),
      ),
    );
  }
}
