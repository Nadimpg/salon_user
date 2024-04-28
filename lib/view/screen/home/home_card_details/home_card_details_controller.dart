import 'package:barber_user_app/service/api_check.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/app_service.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/view/screen/home/home_card_details/home_card_details_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCardDetailsController extends GetxController{

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  var totalReview= 0;
  num avgRating= 0;

  HomeCardDetailsModel homeCardDetailsModel=HomeCardDetailsModel();
  SelonDetails selonDetails=SelonDetails();

  getSalonDetail({required int catId})async{
    setRxRequestStatus(Status.loading);
    update();

    var response=await ApiClient.getData(ApiConstant.salonDetails  +  catId.toString());

    if(response.statusCode==200){

      homeCardDetailsModel=HomeCardDetailsModel.fromJson(response.body);
      // Map<String,dynamic> rawData= homeCardDetailsModel.selonDetails as Map<String, dynamic>;
       var rawData=homeCardDetailsModel.selonDetails;

      if(rawData != null){
        selonDetails=rawData;
        totalReview=homeCardDetailsModel.totalReview!;
        avgRating=homeCardDetailsModel.avgRating!.toDouble();
        update();
      }

      debugPrint("SalonDetails ========== $catId");
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