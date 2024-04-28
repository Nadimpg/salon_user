
import 'package:barber_user_app/utils/app_colors.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/utils/app_icons.dart';
import 'package:barber_user_app/view/screen/notification/inner_widget/notification_card.dart';
import 'package:barber_user_app/view/screen/notification/notification_controller.dart';
import 'package:barber_user_app/view/widgets/appbar/custom_appbar.dart';
import 'package:barber_user_app/view/widgets/back/custom_back.dart';
import 'package:barber_user_app/view/widgets/custom_loader/custom_loader.dart';
import 'package:barber_user_app/view/widgets/custom_text/custom_text.dart';
import 'package:barber_user_app/view/widgets/error/general_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final NotificationController notificationController = Get.find<NotificationController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          backgroundColor: AppColors.bgColor,
          extendBody: true,
          appBar:
          CustomAppBar(appBarContent: CustomBack(text: "Notification".tr)),
          body: Obx(() {
            var data = notificationController.notificationList;
            switch (notificationController.rxRequestStatus.value) {
              case Status.loading:
                return const CustomLoader();
              case Status.internetError:
                return const CustomLoader();
              case Status.error:
                return GeneralErrorScreen(
                  onTap: () {
                    notificationController.getNotifications();
                  },
                );

              case Status.completed:
                return data.isEmpty
                    ? const Center(
                  child: CustomText(
                    text: "No Notifications",
                  ),
                )
                    : ListView.builder(
                  padding:
                  EdgeInsets.only(top: 24.h, left: 20.w, right: 20.w),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    // Check if it's the first item or if the date has changed
                    bool isFirstItem = index == 0;
                    bool isNewDate = !isFirstItem && DateFormat('yMMMd').format(data[index].data!.user!.createdAt!.toLocal()) != DateFormat('yMMMd').format(data[index - 1].data!.user!.createdAt!.toLocal());

                    // Display the date only if it's the first item or the date has changed
                    return Padding(
                      padding: EdgeInsets.only(bottom: 15.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (isFirstItem || isNewDate)
                            //data[index - 1].data!.user!.createdAt!.toString()
                            CustomText(
                              //text: DateConverter.formatValidityDate(data[index].data!.user!.createdAt!.toString()),
                              text: DateFormat('yMMMd').format(data[index].data!.user!.createdAt!.toLocal()),
                              fontWeight: FontWeight.w500,
                              bottom: 16.h,
                            ),
                          NotificationCard(
                            imageSrc: AppIcons.bookingRequest,
                            title: data[index].data!.message!,
                            subText: data[index].data!.description.toString(),
                          ),
                        ],
                      ),
                    );
                  },
                );
            }
          })),
    );
  }
}