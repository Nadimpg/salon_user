import 'package:barber_user_app/service/api_check.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/app_service.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/view/screen/category_individual_list/category_individual_list_model/category_individual_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class categoryIndividualListServiceController extends GetxController{

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  /// =========== categoryIndividual ============
  CategoryIndividualListModel categoryIndividualModel = CategoryIndividualListModel();
  List<Service> categoryIndividualListService = [];


  providerListService({required int catId}) async {
    categoryIndividualListService = [];
    setRxRequestStatus(Status.loading);

    var response = await ApiClient.getData(ApiConstant.categoryIndividualList + catId.toString());

    if (response.statusCode == 200) {
      categoryIndividualModel=CategoryIndividualListModel.fromJson(response.body);

      List<Service>? rawData = categoryIndividualModel.services;

      if (rawData != null && rawData.isNotEmpty) {
        categoryIndividualListService.addAll(rawData);
      }
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
}