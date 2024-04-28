import 'dart:io';

import 'package:barber_user_app/core/app_route/app_route.dart';
import 'package:barber_user_app/helper/prefs_helper.dart';
import 'package:barber_user_app/service/api_check.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/app_service.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/view/screen/profile/profile_model/profile_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController with GetxServiceMixin {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  Rx<ProfileModel> profileModel = ProfileModel().obs;

  bool profileUpdateLoading = false;



  updateProfileControllerValue(ProfileModel profileModel) {
    nameController = TextEditingController(text: profileModel.name);
    emailController = TextEditingController(text: profileModel.email);
    phoneController = TextEditingController(text: profileModel.phoneNumber ?? "");
    addressController = TextEditingController(text: profileModel.address ?? "");
    proImgURL = profileModel.image;
    update();

    Get.toNamed(
      AppRoute.editProfile,
    );
  }

  File? proImage;
  String? proImgURL = "";
  void openGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      proImage = File(pickedFile.path);
      update();
    }
  }
///================== get profile Info =================
  saveProfileID({required int iD}) {
    PrefsHelper.setInt(AppConstants.providerID, iD);
  }

  getProfileInfo() async {
    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiConstant.getProfile);

    if (response.statusCode == 200) {
      profileModel.value = ProfileModel.fromJson(response.body);
      saveProfileID(iD: profileModel.value.id!);
      setRxRequestStatus(Status.completed);
      update();

      debugPrint(
          "Profile Body====================${profileModel.value.image}");
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

  ///============= update profile =============
  updateProfile() async {
    profileUpdateLoading = true;

    var bearerToken =
    await PrefsHelper.getString(AppConstants.bearerToken);
    update();

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $bearerToken'
    };
    var body = {
      "name": nameController.text,
      "email": emailController.text,
      "phone_number": phoneController.text,
      "address": addressController.text,
    };

    var response = proImage == null
        ? await ApiClient.postData(
      headers: headers,
      ApiConstant.profileUpdate,
      body,
    )
        : await ApiClient.postMultipartData(ApiConstant.profileUpdate, body,
        headers: headers,
        multipartBody: [
          MultipartBody("image", proImage!),
        ]);

    if (response.statusCode == 200) {
      proImgURL = "";
      getProfileInfo();
      navigator!.pop();
    } else {
      ApiChecker.checkApi(response);
    }

    profileUpdateLoading = false;
    update();
  }





  @override
  void onInit() {
    getProfileInfo();
    super.onInit();
  }
}