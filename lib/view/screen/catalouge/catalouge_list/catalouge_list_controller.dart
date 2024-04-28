import 'package:barber_user_app/service/api_check.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/app_service.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/view/screen/catalouge/catalouge_list/catalouge_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatalougeListController extends GetxController{

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  /// =========== categoryIndividual ============
  CatalougeListModel catalougeListModel = CatalougeListModel();
  List<Catalog> catalougeList = [];

  var avgrating=0;

  getCatalougeList({required int catId}) async {
    catalougeList = [];
    setRxRequestStatus(Status.loading);

    var response = await ApiClient.getData(ApiConstant.catalougeList + catId.toString());

    if (response.statusCode == 200) {
      catalougeListModel=CatalougeListModel.fromJson(response.body);

      List<Catalog>? rawData = catalougeListModel.catalog;

      if (rawData != null && rawData.isNotEmpty) {
        catalougeList.addAll(rawData);
        avgrating=catalougeListModel.avgRating!.toInt();
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