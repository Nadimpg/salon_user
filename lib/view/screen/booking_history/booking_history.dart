import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/utils/app_icons.dart';
import 'package:barber_user_app/view/screen/booking_history/booking_history_controller.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/button/custom_button.dart';
import 'package:barber_user_app/view/widgets/custom_loader/custom_loader.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/error/general_error.dart';
import 'package:barber_user_app/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingHistory extends StatefulWidget {
    const BookingHistory({super.key});

  @override
  State<BookingHistory> createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  BookingHistoryController controller = Get.find<BookingHistoryController>();
  @override
  void initState() {
    controller.getBookingHistory();
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
            appBarContent: CustomBack(text: "Appointment History".tr),
          ),
          body: RefreshIndicator(
            backgroundColor: AppColors.cardBgColor,
            color: AppColors.primaryOrange,
            onRefresh: () async {
              await controller.getBookingHistory();
            },
            child: Obx(() {
              switch (controller.rxRequestStatus.value) {
                case Status.loading:
                  return const CustomLoader();
                case Status.internetError:
                  return const CustomLoader();
                case Status.error:
                  return GeneralErrorScreen(onTap: () {
                    controller.getBookingHistory();
                  });
                case Status.completed:
                  var data=controller.bookingHistoryModel;
                  return controller.bookingHistoryModel.isEmpty?
                   const Center(
                    child: CustomText(
                      text: 'Empty',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ): ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 20),
                      itemCount: data.length,
                      itemBuilder: (context,index){
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.maxFinite,
                              margin: const EdgeInsets.only(bottom: 24),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.cardBgColor),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: data[index].provider!.businessName.toString(),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                  SizedBox(height: 16.h,),
                                  ///============ date & time =============
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const CustomImage(
                                          imageSrc: AppIcons.bookings, size: 20),
                                      Flexible(
                                        child: CustomText(
                                                    text: '${data[index].date!.toString()}, ${data[index].time.toString()}',
                                            //text: '${data[index].date.toString()} , ${data[index].time.toString()}',
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primaryOrange,
                                            left: 16),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),

                                  ///============= location =============
                                    Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(Icons.location_on_rounded,
                                          color: AppColors.white, size: 16),
                                      CustomText(
                                          text: data[index].provider!.address.toString(),
                                          fontSize: 14,
                                          left: 8)
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      const CustomText(
                                        fontSize: 14,
                                        text: "Catelouge :",
                                      ),
                                      const Expanded(child: SizedBox()),
                                      Flexible(
                                        child: Wrap(
                                          children: List.generate(
                                              data[index].catalogDetails!.length, (index) {
                                            return CustomText(
                                              maxLines: 100,
                                              fontSize: 16.w,
                                              fontWeight: FontWeight.w500,
                                              text: data[index].catalogDetails![0].catalogName.toString(),
                                              right: index % 2 == 0 ? 10.w : 0,
                                            );
                                          }),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  ///if(data[index].status==2)
                                  CustomButton(
                                    titleText: "Rate this Service".tr,
                                    titleSize: 14,
                                    titleWeight: FontWeight.w500,
                                    buttonHeight: 36,
                                    onPressed: () {
                                       Get.toNamed(AppRoute.rateService,arguments: [
                                         data[index].id,
                                         data[index].userId,
                                         data[index].providerId,
                                       ]);
                                      print('Appoinment id ============ ${data[index].catalogDetails![0].catalogName.toString()}');
                                    }
                                  ),
                                ],
                              ),
                            ),

                          ],
                        );
                      });
              }
            }),
          )),
    );
  }
}

