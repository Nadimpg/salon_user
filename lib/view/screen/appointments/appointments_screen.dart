import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/utils/app_icons.dart';
import 'package:barber_user_app/utils/snack_bar.dart';
import 'package:barber_user_app/view/screen/appointments/appointments_controller.dart';
import 'package:barber_user_app/view/screen/booking_details/booking_details_controller.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/button/custom_button.dart';
import 'package:barber_user_app/view/widgets/common_popup/common_popup.dart';
import 'package:barber_user_app/view/widgets/custom_loader/custom_loader.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/error/general_error.dart';
import 'package:barber_user_app/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  AppointmentController controller = Get.find<AppointmentController>();
  @override
  void initState() {
    controller.getAppointment();
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
            appBarContent: CustomBack(text: "Appointments".tr, isIcon: false),
          ),
          body: RefreshIndicator(
            backgroundColor: AppColors.cardBgColor,
            color: AppColors.primaryOrange,
            onRefresh: () async {
              await controller.getAppointment();
            },
            child: Obx(() {
              switch (controller.rxRequestStatus.value) {
                case Status.loading:
                  return const CustomLoader();
                case Status.internetError:
                  return const CustomLoader();
                case Status.error:
                  return GeneralErrorScreen(onTap: () {
                    controller.getAppointment();
                  });
                case Status.completed:
                  var data=controller.appointmentModel;
                  return controller.appointmentModel.isEmpty?const Center(
                    child:  CustomText(
                      text: 'Empty',
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ):
                  ListView.builder(
                    padding:const EdgeInsets.symmetric(
                      vertical: 24,horizontal: 20),
                      itemCount: data.length,
                      itemBuilder: (context,index){
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                print('Appointment id ================= ${data[index].id}');
                                Get.toNamed(AppRoute.bookingDetails,arguments: data[index]);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                margin: const EdgeInsets.only(bottom: 16),
                                width: double.maxFinite,
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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        ///   =========== date & time =================
                                       const CustomImage(imageSrc: AppIcons.bookings, size: 20),
                                        Flexible(
                                          child: CustomText(
                                            maxLines: 2,
                                              text: '${data[index].date!.toString()}, ${data[index].time.toString()}',
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.primaryOrange,
                                              left: 16
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                      Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                       const Icon(Icons.location_on_rounded,
                                            color: AppColors.white, size: 16),
                                        CustomText(
                                            text: data[index].provider!.businessName!,
                                            fontSize: 14,
                                            left: 8)
                                      ],
                                    ),
                                    const SizedBox(height: 8),
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
                                            children: List.generate(
                                                data[index].catalogDetails!.length, (index) {
                                              return CustomText(
                                                maxLines: 100,
                                                fontSize: 16.w,
                                                fontWeight: FontWeight.w500,
                                                text: data[0].catalogDetails![0].catalogName.toString(),
                                                right: index % 2 == 0 ? 10.w : 0,
                                              );
                                            }),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    GetBuilder<BookingDetailsController>(
                                      builder: (bookingController) {
                                          if(data[index].status != 5 ){
                                            return  Row(
                                              children: [
                                                Expanded(
                                                  child: CustomButton(
                                                    titleText: "Cancel".tr,
                                                    borderColor: AppColors.primaryOrange,
                                                    buttonColor: AppColors.cardBgColor,
                                                    buttonHeight: 40,
                                                    onPressed: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return CommonPopUp(
                                                            title: "Booking Cancelled!".tr,
                                                            imageSrc:
                                                            AppIcons.slotUnavailable,
                                                            subText:
                                                            "You have successfully cancelled your booking"
                                                                .tr,
                                                            buttonText: "Back to Home".tr,
                                                            imageType: ImageType.png,
                                                            onPressed: () => Get.offAllNamed(
                                                                AppRoute.navBar),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(width: 16),
                                                /*GetBuilder<BookingDetailsController>(
                                              builder: (bookingController) {
                                                return ;
                                              }
                                            ),*/
                                                Expanded(
                                                  child: CustomButton(
                                                    titleText: "Re-Schedule".tr,
                                                    buttonHeight: 40,
                                                    onPressed: () {
                                                      Get.toNamed(AppRoute.reScheduleAppointment,arguments: data[index].id);
                                                      print('Appointment id ================= ${data[index].id}');
                                                      /*if(bookingController.statusCode==5){
                                                    toastMessage(message: "Re-Schedule not available");
                                                  }else{

                                                  }*/
                                                    },
                                                  ),
                                                )
                                              ],
                                            );
                                          }else{
                                           return SizedBox();
                                          }


                                      }
                                    ),
                                  ],
                                ),
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
