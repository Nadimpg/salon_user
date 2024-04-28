import 'package:barber_user_app/service/api_check.dart';
import 'package:barber_user_app/service/api_url.dart';
import 'package:barber_user_app/service/app_service.dart';
import 'package:barber_user_app/utils/app_constent.dart';
import 'package:barber_user_app/view/screen/notification/notification_model.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  NotificationModel notificationModel=NotificationModel();
  List<Notification> notificationList = [];



  getNotifications() async {
    notificationList=[];
    setRxRequestStatus(Status.loading);

    var response = await ApiClient.getData(ApiConstant.notification);

    if (response.statusCode == 200) {
      notificationModel = NotificationModel.fromJson(response.body);

      List<Notification>? rawData = notificationModel.notifications;

      if (rawData != null && rawData.isNotEmpty) {
        notificationList.addAll(rawData);
      }
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
    getNotifications();
    super.onInit();
  }
}