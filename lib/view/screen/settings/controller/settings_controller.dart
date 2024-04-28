import 'package:barber_user_app/service/api_check.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/app_service.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/utils/snack_bar.dart';
import 'package:barber_user_app/view/screen/settings/model/about_privacy_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController with GetxServiceMixin {
  TextEditingController currentPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  bool loading = false;

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  Rx<AboutPrivacyTermsModel> aboutPrivacyTermsModel =
      AboutPrivacyTermsModel().obs;

  //=======================Change Password==========================

  changePass() async {
    loading = true;
    update();

    var body = {
      "current_password": currentPassController.text,
      "password": newPassController.text,
      "password_confirmation": confirmPassController.text,
    };

    var response = await ApiClient.postData(ApiConstant.changePassword, body);

    if (response.statusCode == 200) {
      toastMessage(message: response.body["message"]);
      navigator!.pop();
    } else {
      ApiChecker.checkApi(response);
    }

    loading = false;
    update();
  }

  aboutPrivacyTerms() async {
    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiConstant.aboutPrivacyTerms);

    if (response.statusCode == 200) {
      aboutPrivacyTermsModel.value =
          AboutPrivacyTermsModel.fromJson(response.body);

      setRxRequestStatus(Status.completed);
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

  @override
  void onInit() {
    aboutPrivacyTerms();
    super.onInit();
  }
}