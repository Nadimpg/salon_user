import 'package:barber_user_app/service/api_check.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/app_service.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/view/screen/category_individual_list/individual_details/individual_details_model/individual_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndividualDetailsController extends GetxController{

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  /// =========== categoryIndividual ============
  IndividualDetailsModel individualDetailsModel = IndividualDetailsModel();
  ServiceDetails individualDetailsList = ServiceDetails() ;

  var totalReview= 0;
  num avgRating= 0;

  providerDetails({required int catId}) async {
    // individualDetailsList = {};
    setRxRequestStatus(Status.loading);

    var response = await ApiClient.getData(ApiConstant.serviceDetail + catId.toString());

    if (response.statusCode == 200) {
      individualDetailsModel=IndividualDetailsModel.fromJson(response.body);

     var rawData = individualDetailsModel.serviceDetails!;

      individualDetailsList=rawData;
      totalReview=individualDetailsModel.review!;
      avgRating=individualDetailsModel.rating!.toDouble();
          debugPrint("CatId ========== $catId");
      // debugPrint("CategoryIndividual=======================${categoryIndividualListService[1].businessName}");
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
  
  // @override
  // void onInit() {
  //   providerDetails(catId: id);
  //   super.onInit();
  // }
}