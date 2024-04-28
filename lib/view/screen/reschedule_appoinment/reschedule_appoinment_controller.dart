import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/service/api_check.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/app_service.dart';
import 'package:barber_user_app/utils/app_icons.dart';
import 'package:barber_user_app/utils/snack_bar.dart';
import 'package:barber_user_app/view/widgets/common_popup/common_popup.dart';
import 'package:barber_user_app/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RescheduleAppointMentController extends GetxController{
  bool isLoading=false;
  var time='9.30 AM'.obs;
  Future<bool> reSchedule({required String id, required String date, required String time}) async {
    isLoading = true;
    update();

    var body = {
      "id": id,
      "date": date,
      "time": time,
    };

    var response = await ApiClient.postData(ApiConstant.reSchedule, body);

    if (response.statusCode == 200) {
       toastMessage(message: "Appointment Rescheduled");
       showDialog(
         context: Get.context!,
         builder: (context) {
           return CommonPopUp(
             title: "Appointment booked".tr,
             imageSrc: AppIcons.successfulAppointment,
             subText: "Your booking has been successfully done.".tr,
             buttonText: "Back to Home".tr,
             imageType: ImageType.png,
             onPressed: () => Get.offAllNamed(AppRoute.navBar),
           );

         },
       );
      isLoading = false;
      update();
      return true;
    } else {
      ApiChecker.checkApi(response);
      isLoading = false;
      update();
      return false;
    }
  }
}