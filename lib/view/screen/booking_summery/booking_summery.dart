import 'dart:convert';

import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/view/screen/book_appointmenmt/book_appointment_controller.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/button/custom_button.dart';
import 'package:barber_user_app/view/widgets/custom_loader/custom_loader.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/row_text/row_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingSummery extends StatelessWidget {
  BookingSummery({super.key});
  final BookAppoinmentController controller =
      Get.find<BookAppoinmentController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(
          appBarContent: CustomBack(text: "Booking Summery".tr),
        ),
        body: GetBuilder<BookAppoinmentController>(
            builder: (bookAppoinmentController) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RowText(
                    field: "Provider name".tr,
                    value: controller
                        .bookAppointmentModel.provider!.businessName
                        .toString() ,
                    fontSize: 16),
                const SizedBox(height: 16),
                RowText(
                    field: "Address".tr,
                    value: controller.bookAppointmentModel.provider!.address
                        .toString(),
                    fontSize: 16),
                const SizedBox(height: 16),
                // RowText(field: "Phone number".tr, value: "(406) 555-0120",fontSize: 16),
                const SizedBox(height: 16),
                RowText(
                    field: "Booking date".tr,
                    value: controller.bookingTime.toString(),
                    fontSize: 16),
                const SizedBox(height: 16),
                RowText(
                    field: "Booking time".tr,
                    value: controller.time.toString(),
                    fontSize: 16),
                const SizedBox(height: 16),

                ///===========  service catalouge list ============
                /* Column(
                    children: List.generate(controller.catalougeList.length, (index) {
                      return RowText(field: "Service".tr, value: controller.catalougeList[index],fontSize: 16);
                    }),
                  ),*/
                Row(
                  children: [
                    const CustomText(
                      fontSize: 14,
                      text: "Catelouge ",
                    ),
                    const Expanded(child: SizedBox()),
                    Expanded(
                      child: Wrap(
                        alignment: WrapAlignment.end,
                        children: List.generate(controller.catalougeList.length,
                            (index) {
                          return CustomText(
                            maxLines: 100,
                            fontSize: 14.h,
                            fontWeight: FontWeight.w500,
                            text: controller.catalougeList[index],
                            right: index % 2 == 0 ? 10.w : 0,
                          );
                        }),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                const SizedBox(height: 16),
                RowText(
                    field: "Service type".tr,
                    value: controller.serviceType.toString(),
                    fontSize: 16),
                const SizedBox(height: 16),
                RowText(
                    field: "Service Duration".tr,
                    value:
                        '${controller.bookAppointmentModel.provider!.services![0].serviceDuration.toString()} minutes',
                    fontSize: 16),
                const SizedBox(height: 16),
                RowText(
                    field: "Total Charge".tr,
                    value: '${controller.totalCharge.toString()} \$',
                    fontSize: 16),
                const SizedBox(height: 16),
                RowText(
                    field: "Advanced Booking Money".tr,
                    value: '${controller.advanceMoney.toString()} \$',
                    fontSize: 16),

                SizedBox(
                  height: 44.h,
                ),
                if (bookAppoinmentController.isConfirm == true)
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error_outline,
                              color: AppColors.white, size: 20),
                          Flexible(
                            child: CustomText(
                              text: "Please wait for the Provider approval".tr,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              maxLines: 2,
                              left: 8,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24, horizontal: 20),
                        child: CustomButton(
                          titleText: 'Go to Home',
                          onPressed: () {
                            Get.toNamed(AppRoute.navBar);
                            controller.isConfirm = false;
                            controller.update();
                          },
                        ),
                      )
                    ],
                  ),
              ],
            ),
          );
        }),
        bottomNavigationBar:
            GetBuilder<BookAppoinmentController>(builder: (bookingController) {
          return controller.isConfirm
              ? const SizedBox()
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: bookingController.loading
                      ? const CustomLoader()
                      : CustomButton(
                          titleText: "Confirm Booking".tr,
                          onPressed: () {
                            for (var serviceData in controller.service) {
                              controller.finalOutput.add({
                                "service_id": serviceData["service_id"],
                                "catalouge_id": serviceData["catalouge_id"],
                              });
                            }
                            String jsonString =
                                jsonEncode(controller.finalOutput);

                            controller.postBooking(
                                serviceDuration: controller
                                    .provider.services![0].serviceDuration
                                    .toString(),
                                service: jsonString,
                                totalPrice: controller.totalAMount.toString(),
                                date: controller.bookingTime.toString(),
                                time: controller.time.value,
                                serviceType:
                                    controller.serviceType.value.toString(),
                                userId: controller.provider.userId.toString(),
                                providerId: controller.provider.id.toString(),
                                advancePrice:
                                    controller.advanceMoney.toString());

                            //Get.toNamed(AppRoute.choosePayment);
                          }),
                );
        }),
      ),
    );
  }
}
