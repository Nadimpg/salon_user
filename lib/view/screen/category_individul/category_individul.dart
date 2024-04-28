import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/view/screen/category_individul/category_individual_controller/category_individual_controller.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/custom_loader/custom_loader.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/error/general_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryIndividual extends StatefulWidget {
  const CategoryIndividual({super.key});

  @override
  State<CategoryIndividual> createState() => _CategoryIndividualState();
}

class _CategoryIndividualState extends State<CategoryIndividual> {
  CategoryIndividualController controller =
      Get.find<CategoryIndividualController>();
  //  CategoryIndividualController controller = Get.put(CategoryIndividualController());

  int catId = Get.arguments[0];
  var catName = Get.arguments[1];

  int currentIndex = 1;
  @override
  void initState() {
    controller.providerList(catId: catId);
    print(
        'providerLength===============> ${controller.categoryIndividualList.length}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: AppColors.bgColor,
          extendBody: true,
          appBar: CustomAppBar(
            appBarContent: CustomBack(text: catName),
          ),
          body: Obx(() {
            switch (controller.rxRequestStatus.value) {
              case Status.loading:
                return const CustomLoader();
              case Status.internetError:
                return const CustomLoader();
              case Status.error:
                return GeneralErrorScreen(onTap: () {
                  controller.providerList(catId: catId);
                });
              case Status.completed:
                return controller.categoryIndividualList.isEmpty
                    ? const Center(
                        child: CustomText(
                          text: "Empty",
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      )
                    : SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListView.builder(
                              itemCount:
                                  controller.categoryIndividualList.length,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var data =
                                    controller.categoryIndividualList[index];
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      currentIndex = index;

                                      Get.toNamed(
                                          AppRoute.categoryIndividualList,
                                          arguments: [data.id,data
                                              .providerDetails!
                                              .businessName]);
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 80.h,
                                          width: 80.w,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "${ApiConstant.baseUrl}images/${controller.categoryIndividualList[index].providerDetails!.coverPhoto.toString()}")),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Flexible(
                                                      child: CustomText(
                                                          text: data
                                                              .providerDetails!
                                                              .businessName
                                                              .toString(),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          maxLines: 2,
                                                          textAlign:
                                                              TextAlign.start,
                                                          right: 8)),
                                                const  Icon(Icons.star,
                                                      size: 16,
                                                      color: AppColors
                                                          .primaryOrange),
                                                   CustomText(
                                                      text: data.avgRating.toString(),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      maxLines: 2,
                                                      textAlign:
                                                          TextAlign.start,
                                                      left: 4),
                                                ],
                                              ),
                                              CustomText(
                                                  text: data
                                                      .providerDetails!.address
                                                      .toString(),
                                                  fontSize: 12,
                                                  maxLines: 2,
                                                  textAlign: TextAlign.start,
                                                  top: 12,
                                                  bottom: 8),
                                            const  Row(
                                                children: [
                                                  Icon(
                                                      Icons.location_on_rounded,
                                                      color: AppColors
                                                          .primaryOrange,
                                                      size: 12),
                                                  CustomText(
                                                      text: "15 Km",
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
                            )
                          ],
                        ),
                      );
            }
          })),
    );
  }
}

///Get.toNamed(AppRoute.categoryIndividualList);
