import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/view/screen/home/home_controller/home_controller.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/custom_loader/custom_loader.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/error/general_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ViewAllNearBy extends StatefulWidget {
  const ViewAllNearBy({super.key});

  @override
  State<ViewAllNearBy> createState() => _ViewAllNearByState();
}

class _ViewAllNearByState extends State<ViewAllNearBy> {
  HomeController nearByController = Get.find<HomeController>();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: AppColors.bgColor,
          extendBody: true,
          appBar: CustomAppBar(
            appBarContent: CustomBack(text: "Nearby Providers".tr),
          ),
          body: Obx(() {
            switch (nearByController.rxRequestStatus.value) {
              case Status.loading:
                return const CustomLoader();
              case Status.internetError:
                return const CustomLoader();
              case Status.error:
                return GeneralErrorScreen(onTap: () {
                  nearByController.nearByProviders();
                });
              case Status.completed:
                return nearByController.nearByList.isEmpty?const Center(
                  child: CustomText(
                    text: 'Empty',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ) : ListView.builder(
                  padding:const EdgeInsets.symmetric(vertical: 24,horizontal: 20),
                  itemCount: nearByController.nearByList.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                          Get.toNamed(AppRoute.homeCardDetails,
                              arguments:
                              nearByController.nearByList[index].id);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(bottom: 16,top: 16),
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
                              height: 80.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "${ApiConstant.baseUrl}images/${nearByController.nearByList[index].coverPhoto}")),
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            SizedBox(
                              width: 16.h,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                          child: CustomText(
                                              text: nearByController
                                                  .nearByList[index]
                                                  .businessName
                                                  .toString(),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              maxLines: 2,
                                              textAlign: TextAlign.start,
                                              right: 8)),
                                     const Icon(Icons.star,
                                          size: 16,
                                          color: AppColors.primaryOrange),
                                      CustomText(
                                          text: nearByController
                                              .nearByList[index].averageRating
                                              .toString(),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          maxLines: 2,
                                          textAlign: TextAlign.start,
                                          left: 4),
                                    ],
                                  ),
                                  CustomText(
                                      text: nearByController
                                          .nearByList[index].address
                                          .toString(),
                                      fontSize: 12,
                                      maxLines: 2,
                                      textAlign: TextAlign.start,
                                      top: 12,
                                      bottom: 8),
                                  Row(
                                    children: [
                                     const Icon(Icons.location_on_rounded,
                                          color: AppColors.primaryOrange,
                                          size: 12),
                                      CustomText(
                                          text: nearByController
                                              .nearByList[index].distance
                                              .toString(),
                                          left: 4,
                                          fontSize: 12)
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
          })),
    );
  }
}
