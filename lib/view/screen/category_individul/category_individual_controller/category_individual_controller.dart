import 'package:barber_user_app/service/api_check.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/app_service.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/view/screen/category_individul/category_individual_model/category_individual_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryIndividualController extends GetxController{
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  /// =========== categoryIndividual ============
  CategoryIndividualModel categoryIndividualModel = CategoryIndividualModel();
  List<ProviderDatum> categoryIndividualList = [];


  providerList({required int catId}) async {
    categoryIndividualList = [];
    setRxRequestStatus(Status.loading);

    var response = await ApiClient.getData(ApiConstant.categoryIndividual + catId.toString());

    if (response.statusCode == 200) {
      categoryIndividualModel=CategoryIndividualModel.fromJson(response.body);

      List<ProviderDatum>? rawData = categoryIndividualModel.providerData;

      if (rawData != null && rawData.isNotEmpty) {
        categoryIndividualList.addAll(rawData);
      }
      debugPrint("CatId ========== $catId");
      // debugPrint("CategoryIndividual=======================${categoryIndividualList[1].businessName}");
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