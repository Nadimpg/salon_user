import 'package:barber_user_app/service/api_check.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/app_service.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/view/screen/catalouge/catalouge_details/catalouge_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalougeDetailsController extends GetxController{
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  var totalReview= 0;
  var avgRating= 0;

  CatalougeDetailsModel catalougeDetailsModel=CatalougeDetailsModel();
  CatalougDetails catalougDetails=CatalougDetails();

  getCatalougeDetail({required int catId})async{
    setRxRequestStatus(Status.loading);
    update();

    var response=await ApiClient.getData(ApiConstant.catalougeDetails  +  catId.toString());

    if(response.statusCode==200){

      catalougeDetailsModel=CatalougeDetailsModel.fromJson(response.body);
      // Map<String,dynamic> rawData= homeCardDetailsModel.selonDetails as Map<String, dynamic>;
      var rawData=catalougeDetailsModel.catalougDetails;

      if(rawData != null){
        catalougDetails=rawData;
        totalReview=catalougeDetailsModel.review!.toInt();
        avgRating=catalougeDetailsModel.rating!.toInt();
        update();
      }

      debugPrint("Catalouge Dtails ========== $catId");
      // debugPrint("salonDetails=======================${salonDetails[32].address}");
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

}