import 'dart:io';

import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/network_image.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/utils/app_icons.dart';
import 'package:barber_user_app/view/screen/profile/inner_widgets/log_out_popup.dart';
import 'package:barber_user_app/view/screen/profile/inner_widgets/profile_cards.dart';
import 'package:barber_user_app/view/screen/profile/profile_controller/profile_controller.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/custom_loader/custom_loader.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/error/general_error.dart';
import 'package:barber_user_app/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = Get.find<ProfileController>();

  @override
  void initState() {
    profileController.getProfileInfo();
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
            appBarContent: CustomBack(text: "Profile".tr, isIcon: false)),
        body: Obx(() {
          switch (profileController.rxRequestStatus.value) {
            case Status.loading:
              return const CustomLoader();
            case Status.internetError:
              return const CustomLoader();
            case Status.error:
              return GeneralErrorScreen(
                onTap: () {
                  profileController.getProfileInfo();
                },
              );

            case Status.completed:
              return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Column(
                    children: [
                      //============================Profile Image and Name Section=================

                      Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(bottom: 24),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.cardBgColor),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ///============================Profile Image=======================

                            profileController.proImage==null ?  CustomNetworkImage(
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

                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ///============================Profile Name====================

                                  CustomText(
                                      fontSize: 16.w,
                                      text: profileController
                                          .profileModel.value.name
                                          .toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),

                                  //============================Profile gmail=================

                                  CustomText(
                                      fontSize: 14.w,
                                      text: profileController
                                          .profileModel.value.email
                                          .toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      top: 8),
                                ],
                              ),
                            ),
                            const SizedBox(width: 24),

                            ///============================Edit Button=====================

                            GestureDetector(
                              onTap: () {
                                // Get.toNamed(AppRoute.editProfile,
                                //     arguments:
                                //         profileController.profileModel.value);

                                profileController.updateProfileControllerValue(
                                    profileController.profileModel.value);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                    color: AppColors.primaryOrange,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    const CustomImage(
                                        imageSrc: AppIcons.edit, size: 18),
                                    CustomText(
                                        text: "Edit".tr, left: 4, fontSize: 14)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      ProfileCards(
                          imageSrc: AppIcons.bookings,
                          text: "Appointment History".tr,
                          onTap: () {
                            Get.toNamed(AppRoute.bookingHistory);
                          }),
                      const SizedBox(height: 16),
                      ProfileCards(
                          imageSrc: AppIcons.bookings,
                          text: "Booking request".tr,
                          onTap: () {
                            Get.toNamed(AppRoute.bookingRequestScreen);
                          }),
                      const SizedBox(height: 16),
                      // ProfileCards(
                      //   imageSrc: AppIcons.subscriptionPlan,
                      //   text: "My Plan".tr,
                      //   onTap: () {
                      //     showDialog(
                      //       context: context,
                      //       builder: (context) {
                      //         return AlertDialog(
                      //           contentPadding: const EdgeInsets.all(0),
                      //           backgroundColor: AppColors.cardBgColor,
                      //           shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(8)),
                      //           content: const SubscriptionPlanCard(
                      //               months: "3",
                      //               price: "200",
                      //               buttonText: "Renew",
                      //               title: "Gold"),
                      //         );
                      //       },
                      //     );
                      //   },
                      // ),
                      // const SizedBox(height: 16),
                      ProfileCards(
                          imageSrc: AppIcons.settings,
                          text: "Settings".tr,
                          onTap: () {
                            Get.toNamed(AppRoute.settings);
                          }),
                      const SizedBox(height: 16),
                      ProfileCards(
                        imageSrc: AppIcons.logOut,
                        text: "Log out".tr,
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const LogOutPopUp();
                            },
                          );
                        },
                      ),
                    ],
                  ));
          }
        }),
      ),
    );
  }
}
