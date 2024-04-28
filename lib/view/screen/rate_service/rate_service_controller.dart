import 'package:barber_user_app/service/api_check.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/app_service.dart';
import 'package:barber_user_app/utils/snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RateServiceController extends GetxController {
  bool isLoading = false;
  var ratings=5.obs;
  TextEditingController serviceController=TextEditingController();
  postRating(
      {required String user_id,
      required String service_id,
      required String provider_id,
      required int rating,
      required String review})async{
    isLoading = true;
    update();

    var body = {
      "user_id": user_id,
      "review": review,
      "rating": rating.toString(),
      "service_id": service_id,
      "providerId": provider_id
    };

    var response = await ApiClient.postData(ApiConstant.saveRating, body);

    if (response.statusCode == 200) {
      toastMessage(message: "Ratings Uploaded");
      Get.back();
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
