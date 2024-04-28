/*
import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/utils/app_icons.dart';
import 'package:barber_user_app/view/screen/home/home_controller/home_controller.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/custom_loader/custom_loader.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/error/general_error.dart';
import 'package:barber_user_app/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List<String> category = [
    //   "Spa",
    //   "Nails",
    //   "Barber",
    //   "Salon",
    //   "Women’s",
    //   "Men’s",
    //   "Massage",
    //   "Piercing",
    //   "Skin care",
    //   "Hair Care",
    //   "Makeover",
    //   "Facial"
    // ];

    HomeController categoryController = Get.put(HomeController());

    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: AppColors.bgColor,
          extendBody: true,
          appBar: CustomAppBar(
            appBarContent: CustomBack(text: "Select Categorie".tr),
          ),
          body: Obx(() {
            switch (categoryController.rxRequestStatus.value) {
              case Status.loading:
                return const CustomLoader();
              case Status.internetError:
                return const CustomLoader();
              case Status.error:
                return GeneralErrorScreen(
                  onTap: () {
                    categoryController.getCategory();
                  },
                );

              case Status.completed:
                return SingleChildScrollView(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      //==============================Search Field==============================


                      Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(bottom: 24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.cardBgColor,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  const Icon(Icons.search,
                                      size: 18, color: AppColors.paragraph),
                                  CustomText(
                                      text: "Search".tr,
                                      color: AppColors.paragraph,
                                      fontSize: 14,
                                      left: 12),
                                ],
                              ),
                            ),
                            const CustomImage(
                              imageSrc: AppIcons.filter,
                              size: 18,
                              imageColor: AppColors.paragraph,
                            ),
                          ],
                        ),
                      ),

                      //==============================Cetegorys==============================
                      SingleChildScrollView(
                        physics: const ClampingScrollPhysics(),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 24,
                              mainAxisExtent: 120),
                          itemCount:
                          categoryController.categoryList.length,
                          itemBuilder: (context, index) {
                            var data =
                            categoryController.categoryList[index];
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoute.categoryIndividual,arguments: data.id);
                                // Get.toNamed(AppRoute.providerDetails,
                                //     arguments: data.id);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 85.w,
                                    width: 85.w,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "${ApiConstant.baseUrl}${data.categoryImage!}")),
                                        borderRadius:
                                        BorderRadius.circular(12)),
                                  ),
                                  CustomText(
                                      text: data.categoryName ?? "",
                                      fontSize: 14,
                                      top: 8)
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
            }
          }
          )
      ),
    );
  }
}*/

import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/view/screen/category/category_controller.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/custom_loader/custom_loader.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/custom_textfield/custom_textfield.dart';
import 'package:barber_user_app/view/widgets/error/general_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryController addNewServiceController = Get.find<CategoryController>();

    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: AppColors.bgColor,
          extendBody: true,
          appBar: CustomAppBar(
            appBarContent: CustomBack(text: "Select Categories".tr),
          ),
          body: RefreshIndicator(
            backgroundColor: AppColors.cardBgColor,
            color: AppColors.primaryOrange,
            onRefresh: () async {
              await addNewServiceController.getCategory();
            },
            child: Obx(() {
              switch (addNewServiceController.rxRequestStatus.value) {
                case Status.loading:
                  return const CustomLoader();
                case Status.internetError:
                  return const CustomLoader();
                case Status.error:
                  return GeneralErrorScreen(
                    onTap: () {
                      addNewServiceController.getCategory();
                    },
                  );

                case Status.completed:
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 24),
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //==============================Search Field==============================

                        CustomTextField(
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (value) {
                            if (value.isNotEmpty) {
                              addNewServiceController.getCategory(
                                  search: value);
                            }
                          },
                          hintText: "Search".tr,
                          hintColor: AppColors.white,
                          fillColor: AppColors.stroke,
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 24,
                            color: AppColors.white,
                          ),

                        ),
                        SizedBox(
                          height: 24.h,
                        ),

                        //==============================Cetegorys===================================

                        addNewServiceController.categoryList.isEmpty
                            ? const Center(
                                child: Column(
                                  children: [
                                    SizedBox(height: 200,),
                                    CustomText(
                                      text: "Empty",
                                      fontSize: 16,
                                    ),
                                  ],
                                ),
                              )
                            : SingleChildScrollView(
                                physics: const ClampingScrollPhysics(),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 16,
                                          mainAxisSpacing: 24,
                                          mainAxisExtent: 120),
                                  itemCount: addNewServiceController
                                      .categoryList.length,
                                  itemBuilder: (context, index) {
                                    var data = addNewServiceController
                                        .categoryList[index];
                                    return GestureDetector(
                                      onTap: () {
                                        Get.toNamed(AppRoute.categoryIndividual,
                                            arguments: [data.id,data.categoryName]);
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 85.w,
                                            width: 85.w,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        "${ApiConstant.baseUrl}${data.categoryImage!}")),
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                          ),
                                          CustomText(
                                              text: data.categoryName ?? "",
                                              fontSize: 14,
                                              top: 8)
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),

                        if (addNewServiceController.clearSearch.value == false)
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: IconButton(
                                  onPressed: () {
                                    addNewServiceController.getCategory(
                                        search: "");

                                    addNewServiceController.clearSearch.value =
                                        true;
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: AppColors.primaryOrange,
                                  )))
                      ],
                    ),
                  );
              }
            }),
          )),
    );
  }
}
