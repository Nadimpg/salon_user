import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/view/screen/category_individual_list/category_individual_list_controller/category_individual_list_controller.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/custom_loader/custom_loader.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/error/general_error.dart';
import 'package:barber_user_app/view/widgets/row_text/row_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryIndividualList extends StatefulWidget {
  CategoryIndividualList({super.key});


  @override
  State<CategoryIndividualList> createState() => _CategoryIndividualListState();
}

class _CategoryIndividualListState extends State<CategoryIndividualList> {
  int currentIndex = 0;
  int catId = Get.arguments[0];
  var catName = Get.arguments[1];
  categoryIndividualListServiceController controller = Get.find<categoryIndividualListServiceController>();
  @override
  void initState() {
    controller.providerListService(catId: catId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: AppColors.bgColor,
          extendBody: true,
          appBar:   CustomAppBar(
            appBarContent: CustomBack(text:  catName),
          ),
          body: Obx(() {
            switch (controller.rxRequestStatus.value) {
              case Status.loading:
                return const CustomLoader();
              case Status.internetError:
                return const CustomLoader();
              case Status.error:
                return GeneralErrorScreen(onTap: () {
                  controller.providerListService(catId: catId);
                });
              case Status.completed:
                return controller.categoryIndividualListService.isEmpty? const Center(
                  child: CustomText(
                    text: 'Empty',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                )  : SingleChildScrollView( // Add 'return' here
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        itemCount: controller.categoryIndividualListService.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          var data=controller.categoryIndividualListService[index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = index;
                                Get.toNamed(AppRoute.individualDetails,arguments: data.serviceDetails?.id);
                              });
                            },
                            child: Container(
                              width: double.maxFinite,
                              margin: const EdgeInsets.only(bottom: 16),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  width: 1,
                                  color: currentIndex == index
                                      ? AppColors.primaryOrange
                                      : Colors.transparent,
                                  style: BorderStyle.solid,
                                ),
                                color: AppColors.cardBgColor,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 100.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "${ApiConstant.baseUrl}images/${data.serviceDetails!.gallaryPhoto![0]}")),
                                        borderRadius:
                                        BorderRadius.circular(12)),
                                  ),
                                  SizedBox(width: 12.w,),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                         Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: CustomText(
                                                text: data.serviceName.toString(),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                maxLines: 2,
                                                textAlign: TextAlign.start,
                                                right: 8,
                                              ),
                                            ),
                                            const Icon(
                                              Icons.star,
                                              size: 16,
                                              color: AppColors.primaryOrange,
                                            ),
                                              CustomText(
                                              text: data.avgServiceRating.toString(),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              maxLines: 2,
                                              textAlign: TextAlign.start,
                                              left: 4,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                         Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.watch_later_outlined,
                                              color: AppColors.primaryOrange,
                                              size: 12,
                                            ),
                                            CustomText(
                                              text: data.serviceDetails!.serviceDuration.toString(),
                                              fontSize: 12,
                                              left: 4,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 12),
                                        RowText(
                                          field: "Salon Service".tr,
                                          value: data.serviceDetails!.serviceDuration.toString(),
                                          color: AppColors.primaryOrange,
                                        ),
                                        const SizedBox(height: 12),
                                        RowText(
                                          field: "Home Service".tr,
                                          value: data.serviceDetails!.serviceDuration.toString(),
                                          color: AppColors.primaryOrange,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );

            }
          })),
    );
  }
}
