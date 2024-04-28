import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/service/api_check.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/app_service.dart';
import 'package:barber_user_app/utils/app_icons.dart';
import 'package:barber_user_app/utils/snack_bar.dart';
import 'package:barber_user_app/view/screen/appointments/appointments_controller.dart';
import 'package:barber_user_app/view/widgets/common_popup/common_popup.dart';
import 'package:barber_user_app/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingDetailsController extends GetxController{
  AppointmentController appointmentController = Get.find<AppointmentController>();
  bool isLoading=false;
  var statusCode=0;
  acceptBooking({required String id,required UpdateBooking updateBooking})async{
      isLoading=true;
      update();

      var body={
        "id" : id,
        "status" : updateBooking == UpdateBooking.start ? "5" : "6"
      };

      var response = await ApiClient.postData(ApiConstant.acceptBooking, body);

      if (response.statusCode == 200) {
        if(statusCode==10){
          appointmentController.getAppointment();
          toastMessage(message: "Service Started");
          Get.back();
         // update();
        }else{
          toastMessage(message: "Service Ended");
          showDialog(
            context: Get.context!,
            builder: (context) {
              return CommonPopUp(
                title: "Service Completed".tr,
                imageSrc: AppIcons.successfulAppointment,
                subText: "Your Service has been successfully done.".tr,
                buttonText: "Back to Home".tr,
                imageType: ImageType.png,
                onPressed: () => Get.offAllNamed(AppRoute.navBar),
              );
            },
          );
        }
    /*    statusCode=5;
        update();*/
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
enum UpdateBooking { start,end}