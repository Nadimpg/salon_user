import 'package:barber_user_app/helper/date_converter.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/view/screen/category_individual_list/inner_widget/review_card.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReviewScreen extends StatelessWidget {
    ReviewScreen({super.key});

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

            ///========= user review =========
            if(data.providerRating!.isNotEmpty)  CustomText(
                text: "User Review".tr,
                fontWeight: FontWeight.w600,
                bottom: 16),

            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              // providerDetails.providerRating!.length
              itemCount: data.providerRating?.length,
              itemBuilder: (BuildContext context,index) {
                var reviewCard = ReviewCard(
                  imageWidget: Container(
                    height: 40.w,
                    width: 50.w,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "${ApiConstant.baseUrl}${data.providerRating![index].user!.image}"))
                    ),
                  ),
                  name: data.providerRating![index].user!.name.toString(),
                  description: data.providerRating![index].review.toString(),
                 month: DateConverter.formatValidityDate(data.providerRating![index].createdAt),
                 // month:data.providerRating![index].createdAt.toString(),
                 // month: DateFormat('yMMMd').format(data.providerRating![index].createdAt!.toLocal()),
                  userRating: data.providerRating![index].rating!.toDouble(), number: index+1 ,
                  // rating: providerDetails.providerRating![index].rating!.toDouble(),
                  //   data.providerRating![index].createdAt! == null ? '' : DateConverter.isoStringToLocalAMPM(data.providerRating![index].createdAt.toString() )
                );
                return reviewCard;
              },
            ),
          ],
        ),
      ),
    );
  }
}

///NetworkImage(
//                                   "${ApiConstant.baseUrl}images/${data.providerRating![index].user!.image}")