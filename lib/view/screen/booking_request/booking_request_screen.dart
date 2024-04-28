import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/view/screen/booking_request/booking_request_controller.dart';
import 'package:barber_user_app/view/screen/makePayment/controller/make_payment_controller.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/booking_card/booking_card.dart';
import 'package:barber_user_app/view/widgets/custom_loader/custom_loader.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/error/general_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingRequestScreen extends StatefulWidget {
  const BookingRequestScreen({super.key});

  @override
  State<BookingRequestScreen> createState() => _BookingRequestScreenState();
}

class _BookingRequestScreenState extends State<BookingRequestScreen> {
  BookingRequestController controller = Get.find<BookingRequestController>();
  MakePaymentController makePaymentController=Get.find<MakePaymentController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: CustomAppBar(
        appBarContent: CustomBack(text: "Booking Request".tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: RefreshIndicator(
          backgroundColor: AppColors.cardBgColor,
          color: AppColors.primaryOrange,
          onRefresh: () async {
            await controller.getBookingRequest();
          },
          child: Obx(() {
            switch (controller.rxRequestStatus.value) {
              case Status.loading:
                return const CustomLoader();
              case Status.internetError:
                return const CustomLoader();
              case Status.error:
                return GeneralErrorScreen(
                  onTap: () {
                    controller.getBookingRequest();
                  },
                );

              case Status.completed:
                return controller.bookingReqModel.isEmpty?const Center(
                  child: CustomText(
                    text: 'Empty',
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ) : ListView.builder(
                   // controller: controller.scrollController,
                    itemCount: controller.bookingReqModel.length,
                    itemBuilder: (context, index) {
                      var data = controller.bookingReqModel[index];
                      return BookingCard(
                        businessName: data.booking!.provider!.businessName ?? '',
                        buttonColor:data.booking!.status !=0? AppColors.primaryOrange : AppColors.statusColor,
                        approved: data.booking!.status.toString(),
                        profileImage:
                            "${ApiConstant.baseUrl}${data.booking!.user!.image}",
                        profileName: data.booking!.user!.name.toString(),
                        value1: data.booking!.date!.toString(),
                        //  text: '${DateFormat('yMMMd').format(data[index].createdAt!.toLocal()) } , ${data[index].time.toString()}',
                        value3: '${data.booking!.price}',
                        button: 'Make Payment',

                        onPressed: () {
                           if(data.booking!.status == 1) {
                             makePaymentController.generateGatewayLink(
                              ammount: data.booking!.price
                                  .toString(),
                              bookingid: data.booking!.id.toString(), providerId: data.booking!.providerId.toString(), userId: data.booking!.userId.toString());
                           }
                          //print('id ++++++++++++++++${data.booking!.userId}');
                         // print('amount ++++++++++++++++${}');
                        },
                        serviceContent: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText(
                              fontSize: 14,
                              text: "Catelouge ",
                            ),
                            const Expanded(child: SizedBox()),
                            Flexible(
                              child: Wrap(
                                children: List.generate(
                                    data.catalogDetails!.length, (index) {
                                  return CustomText(
                                    maxLines: 100,
                                    fontSize: 16.w,
                                    fontWeight: FontWeight.w500,
                                    text: data.catalogDetails![index].catalogName.toString(),
                                    right: index % 2 == 0 ? 10.w : 0,
                                  );
                                }),
                              ),
                            )
                          ],
                        ),
                      );
                    });
            }
          }),
        ),
      ),
    );
  }
}

