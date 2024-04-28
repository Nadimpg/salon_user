import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_images.dart';
import 'package:barber_user_app/view/screen/search/search_controller.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ServiceCard extends StatefulWidget {
  const ServiceCard({super.key});


  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {

  SearchsController searchsController=Get.put(SearchsController());

  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return searchsController.searchList.isEmpty?Center(
      child: Column(
        children: [
          SizedBox(height: 200.h,),
          const CustomText(
            text: 'No Provider found',
            fontSize: 16,
            color: Colors.white,
          ),
        ],
      ),
    )  : ListView.builder(
      itemCount: searchsController.searchList.length,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              currentIndex = index;
              Get.toNamed(AppRoute.homeCardDetails, arguments: searchsController.searchList[index].id);
            });
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 16),
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.cardBgColor,
              border: Border.all(
                color: currentIndex == index
                    ? AppColors.primaryOrange
                    : Colors.transparent,
                style: BorderStyle.solid,
                width: 1,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 80,width: 80,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: const DecorationImage(image: AssetImage(AppImages.salon),fit: BoxFit.fill)
                  ),
                ),
                 Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(child: CustomText(text: searchsController.searchList[index].businessName.toString(),fontSize: 16,fontWeight: FontWeight.w600,maxLines: 2,textAlign: TextAlign.start,right: 8)),
                          const Icon(Icons.star,size: 16,color: AppColors.primaryOrange),
                          CustomText(text: searchsController.searchList[index].averageRating.toString(),fontSize: 12,fontWeight: FontWeight.w600,maxLines: 2,textAlign: TextAlign.start,left: 4),
                        ],
                      ),
                      CustomText(text: searchsController.searchList[index].address.toString(),fontSize: 12,maxLines: 2,textAlign: TextAlign.start,top: 12,bottom: 8),
                      Row(
                        children: [
                          const Icon(Icons.location_on_rounded,color: AppColors.primaryOrange,size: 12),
                          CustomText(text: searchsController.searchList[index].distance.toString(),left: 4,fontSize: 12)
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
