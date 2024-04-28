import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/network_image.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/view/screen/booking_details/booking_details_controller.dart';
import 'package:barber_user_app/view/screen/profile/profile_controller/profile_controller.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/button/custom_button.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/row_text/row_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({super.key});

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  final ProfileController profileController = Get.find<ProfileController>();
  BookingDetailsController controller = Get.find<BookingDetailsController>();
  // DecodedBooking? data;
  dynamic data;
  Uri dialNumber = Uri(scheme: 'tel', path: '');
  @override
  void initState() {
    data = Get.arguments;
    controller.statusCode = data!.status;
    dialNumber = Uri(
        scheme: 'tel',
        path: profileController.profileModel.value.phoneNumber.toString());
    super.initState();
  }

  /*Uri dialNumber=Uri(scheme: 'tel' , path: '01923647795');
  callNumber()async{
    await launchUrl(dialNumber);
  }*/

  callNumber() async {
    await launchUrl(dialNumber);
  }

  // DecodedBooking? data=Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        extendBody: true,
        appBar: CustomAppBar(
          appBarContent: CustomBack(text: "Booking Details".tr),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /*Container(
                          height: 64,width: 64,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage(AppImages.profile),fit: BoxFit.fill)
                          ),
                        ),*/
                        CustomNetworkImage(
                          borderRadius: BorderRadius.circular(8),
                          imageUrl:
                              "${ApiConstant.baseUrl}images/${data!.provider.coverPhoto}",
                          height: 64.h,
                          width: 64.w,
                        ),
                        SizedBox(
                          width: 12.h,
                        ),
                        Flexible(
                            child: CustomText(
                                text: data!.provider.businessName.toString(),
                                fontWeight: FontWeight.w500,
                                maxLines: 2,
                                textAlign: TextAlign.start))
                      ],
                    ),
                  ),
                  /* GestureDetector(
                    onTap: ()=>callNumber() ,
                    child: Container(
                      margin: const EdgeInsets.only(left: 12),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primaryOrange,
                      ),
                      child: const Icon(Icons.call,
                          color: AppColors.white, size: 18),
                    ),
                  ),*/
                ],
              ),
              const SizedBox(height: 24),
              RowText(
                  field: "Booking date".tr,
                  // value: data!.date.toString(),
                  value: data.date!.toString(),
                  fontSize: 16),
              const SizedBox(height: 16),
              RowText(
                  field: "Address".tr,
                  value: data!.provider!.address.toString(),
                  fontSize: 16),
              /*  const SizedBox(height: 16),
              RowText(field: "Phone Number :".tr, value: "(406) 555-0120"),*/
              const SizedBox(height: 16),
              // RowText(field: "Services :".tr, value: "Regular Hair Cut, Hair Spa",maxLine: 2),
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
                      children:
                          List.generate(data!.catalogDetails!.length, (index) {
                        return CustomText(
                          maxLines: 100,
                          fontSize: 16.w,
                          fontWeight: FontWeight.w500,
                          text: data!.catalogDetails![index].catalogName
                              .toString(),
                          right: index % 2 == 0 ? 10.w : 0,
                        );
                      }),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              RowText(
                  field: "Service Type :".tr,
                  value: data!.serviceType.toString()),
              const SizedBox(height: 16),
              RowText(
                  field: "Service Duration :".tr,
                  value: '${data!.serviceDuration.toString()} Minutes'),
              const SizedBox(height: 16),
              RowText(
                  field: "Total Amount :".tr,
                  value: "\$ ${data!.price.toString()}"),
              const SizedBox(height: 16),
              // RowText(field: "Phone Number :".tr, value: profileController.profileModel.value.phoneNumber.toString()),
              const SizedBox(height: 16),
              RowText(
                  field: "Paid Advance :".tr,
                  value: "\$ ${data!.advanceMoney.toString()}"),
              const SizedBox(height: 16),
              RowText(field: "Payment Method :".tr, value: "Debit Card"),
              const SizedBox(height: 16),
             /* RowText(
                field: "Re-Schedule booking :".tr,
                value: "Click Here",
                color: AppColors.primaryOrange,
                onTap: () => Get.toNamed(AppRoute.reScheduleAppointment,
                    arguments: data!.id),
              ),*/
            ],
          ),
        ),
        bottomNavigationBar:
            GetBuilder<BookingDetailsController>(builder: (controller) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            physics: const ClampingScrollPhysics(),
            child: Row(
              children: [
                ///============ start button ==================
                Expanded(
                    child: CustomButton(
                        titleText: controller.statusCode == 10 ? "Start" : "End",
                        buttonHeight: 44,
                        onPressed: () {
                          if(controller.statusCode==10){
                            controller.acceptBooking(
                                id: data!.id.toString(),
                                updateBooking: UpdateBooking.start);
                          }else{
                            controller.acceptBooking(
                                id: data!.id.toString(),
                                updateBooking: UpdateBooking.end);
                          }
                          // Get.toNamed(AppRoute.choosePayment);
                        })),
              ],
            ),
          );
        }),
      ),
    );
  }
}
