import 'dart:io';

import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/network_image.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/utils/app_icons.dart';
import 'package:barber_user_app/utils/app_images.dart';
import 'package:barber_user_app/view/screen/home/home_controller/home_controller.dart';
import 'package:barber_user_app/view/screen/home/inner_widget/custom_card.dart';
import 'package:barber_user_app/view/screen/profile/profile_controller/profile_controller.dart';
import 'package:barber_user_app/view/widgets/custom_loader/custom_loader.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/error/general_error.dart';
import 'package:barber_user_app/view/widgets/image/custom_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ProfileController profileController = Get.find<ProfileController>();
  List<String> category = [
    "Spa",
    "Nails",
    "Barber",
    "Salon",
    "Women’s",
    "Men’s",
    "Massage",
    "Piercing",
    "Skin care",
    "Hair Care",
    "Makeover",
    "Facial"
  ];
  List<String> image = [
    AppImages.salon,
    AppImages.salon,
    AppImages.salon,
    AppImages.salon,
    AppImages.salon
  ];
  int currentIndex = 0;

  HomeController categoryController = Get.find<HomeController>();
  HomeController featuredController = Get.find<HomeController>();
  HomeController nearByController = Get.find<HomeController>();
  HomeController controller=Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: AppColors.bgColor,
          extendBody: true,
          appBar: PreferredSize(
            preferredSize: const Size(double.maxFinite, 80),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 /* Container(
                    height: 48,
                    width: 48,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(AppImages.profile),
                            fit: BoxFit.fill)),
                  ),*/
                  ///============================Profile Image=======================

                  profileController.proImage==null ?
                  CustomNetworkImage(
                    boxShape: BoxShape.circle,
                    imageUrl:
                    "${ApiConstant.baseUrl}${profileController.profileModel.value.image}",
                    height: 64.w,
                    width: 64.w,
                  ):
                  Container(
                    height: 64.h,
                    width: 64.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(
                            File(
                              profileController.proImage!.path,
                            ),
                          ),

                        ),
                        shape: BoxShape.circle
                    ),
                  ),
                  CustomText(
                      text: "Atyose".tr,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoute.notification);
                    },
                    child:const Stack(
                      children: [
                          Align(
                          alignment: Alignment.center,
                          child: CustomImage(
                              imageSrc: AppIcons.notification, size: 24),
                        ),
                  /*      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            height: 10,
                            width: 10,
                            margin: const EdgeInsets.only(left: 14, bottom: 14),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primaryOrange),
                          ),
                        ),*/
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: RefreshIndicator(
            backgroundColor: AppColors.cardBgColor,
            color: AppColors.primaryOrange,
            onRefresh: () async {
              await controller.homeRespose();
            },
            child: Obx(() {
              switch (categoryController.rxRequestStatus.value) {
                case Status.loading:
                  return const CustomLoader();
                case Status.internetError:
                  return const CustomLoader();
                case Status.error:
                  return GeneralErrorScreen(onTap: () {
                    categoryController.homeRespose();
                  });
                case Status.completed:
                  return SingleChildScrollView(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///======== Image  Slider =========
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CarouselSlider.builder(
                              itemCount: image.length,
                              itemBuilder: (context, index, realIndex) =>
                                  Container(
                                height: 180,
                                width: double.maxFinite,
                                margin: const EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: AssetImage(image[index]),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              options: CarouselOptions(
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      currentIndex = index;
                                    });
                                  },
                                  enableInfiniteScroll: true,
                                  viewportFraction: 1,
                                  height: 250,
                                  autoPlay: true),
                            ),
                            DotsIndicator(
                              decorator: const DotsDecorator(
                                color: AppColors.cardBgColor,
                                activeColor: AppColors.white,
                              ),
                              dotsCount: image.length,
                              position: currentIndex,
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),

                        ///=========Search ==========
                        GestureDetector(
                          onTap: () => Get.toNamed(AppRoute.categoryScreen),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.only(bottom: 24),
                            width: double.maxFinite,
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
                                /*const CustomImage(
                                  imageSrc: AppIcons.filter,
                                  size: 18,
                                  imageColor: AppColors.paragraph,
                                ),*/
                              ],
                            ),
                          ),
                        ),

                        ///======== category list =========
                       if(categoryController.categoryList.isNotEmpty) Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(
                                text: "Categories".tr,
                                fontWeight: FontWeight.w600),
                            GestureDetector(
                              onTap: () => Get.toNamed(AppRoute.categoryScreen),
                              child: CustomText(
                                text: "View All".tr,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: AppColors.primaryOrange,
                              ),
                            ),
                          ],
                        ),

                      categoryController.categoryList.isEmpty?  const Center(
                        child: CustomLoader(),
                      ) :
                      Container(
                          height: 120,
                          margin: const EdgeInsets.only(top: 16),
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: categoryController.categoryList.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => Get.toNamed(AppRoute.categoryScreen),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 16),
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
                                                    "${ApiConstant.baseUrl}${categoryController.categoryList[index].categoryImage}")),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                      ),
                                      CustomText(
                                          text: categoryController
                                                  .categoryList[index]
                                                  .categoryName ??
                                              "",
                                          fontSize: 14,
                                          top: 8)
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        ///==========Featured provider ===========
                        const SizedBox(height: 24),
                     if(featuredController.featuredList.isNotEmpty)   Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(
                                text: "Featured Providers".tr,
                                fontWeight: FontWeight.w600),
                            GestureDetector(
                              onTap: () => Get.toNamed(AppRoute.viewAllScreen),
                              child: CustomText(
                                text: "View All".tr,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: AppColors.primaryOrange,
                              ),
                            ),
                          ],
                        ),

                        ///========== featured providers ============

                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              featuredController.featuredList.length,
                                  (index) =>
                                      CustomCard(
                                        onPressed: () {
                                          Get.toNamed(AppRoute.homeCardDetails, arguments: featuredController.featuredList[index].id);
                                          print(
                                              'index===========${featuredController.featuredList[index].businessName}');
                                        },
                                        imageWidget: Container(
                                          height: 100.w,
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "${ApiConstant.baseUrl}images/${featuredController.featuredList[index].coverPhoto}")),
                                              borderRadius: BorderRadius.circular(12)),
                                        ),
                                        moreContent: true,
                                        title1: featuredController
                                            .featuredList[index].businessName
                                            .toString(),
                                        title2: featuredController
                                            .featuredList[index].address
                                            .toString(),
                                        km: '${featuredController.featuredList[index].distance?.toStringAsFixed(2)} km',
                                        ratting: featuredController.featuredList[index].averageRating.toString(),
                                      ),
                            ).toList(),
                          ),
                        ),
                        const SizedBox(height: 24),

                        ///======== nearby providers =========
                       if(nearByController.nearByList.isNotEmpty) Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(
                                text: "Nearby Providers".tr,
                                fontWeight: FontWeight.w600),
                            GestureDetector(
                              onTap: () => Get.toNamed(AppRoute.viewAllNearBy),
                              child: CustomText(
                                text: "View All".tr,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: AppColors.primaryOrange,
                              ),
                            ),
                          ],
                        ),

                        ///======== nearby providers =========
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              nearByController.nearByList.length,
                              (index) =>
                                  CustomCard(
                                onPressed: () {
                                  Get.toNamed(AppRoute.homeCardDetails,arguments: nearByController.nearByList[index].id);
                                },
                                    imageWidget: Container(
                                      height: 100.w,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "${ApiConstant.baseUrl}images/${nearByController.nearByList[index].coverPhoto}")),
                                          borderRadius: BorderRadius.circular(12)),
                                    ),
                                moreContent: true,
                                title1: nearByController.nearByList[index].businessName.toString(),
                                title2: nearByController.nearByList[index].address.toString(),
                                km: '${nearByController.nearByList[index].distance?.toStringAsFixed(2)} km',
                                ratting: nearByController.nearByList[index].averageRating.toString(),
                              ),
                            ).toList(),
                          ),
                        ),
                      ],
                    ),
                  );
              }
            }),
          )
      ),
    );
  }
}
