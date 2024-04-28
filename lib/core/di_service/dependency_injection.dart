import 'package:barber_user_app/view/screen/appointments/appointments_controller.dart';
import 'package:barber_user_app/view/screen/auth/location_controller/location_controller.dart';
import 'package:barber_user_app/view/screen/auth/sign_in/sign_in_controller/sign_in_controller.dart';
import 'package:barber_user_app/view/screen/auth/sign_up/sign_up_controller/sign_up_controller.dart';
import 'package:barber_user_app/view/screen/book_appointmenmt/book_appointment_controller.dart';
import 'package:barber_user_app/view/screen/booking_details/booking_details_controller.dart';
import 'package:barber_user_app/view/screen/booking_history/booking_history_controller.dart';
import 'package:barber_user_app/view/screen/booking_request/booking_request_controller.dart';
import 'package:barber_user_app/view/screen/catalouge/catalouge_details/catalouge_details_controller.dart';
import 'package:barber_user_app/view/screen/catalouge/catalouge_list/catalouge_list_controller.dart';
import 'package:barber_user_app/view/screen/category/category_controller.dart';
import 'package:barber_user_app/view/screen/category_individual_list/category_individual_list_controller/category_individual_list_controller.dart';
import 'package:barber_user_app/view/screen/category_individual_list/individual_details/individual_details_controller/individual_details_controller.dart';
import 'package:barber_user_app/view/screen/category_individul/category_individual_controller/category_individual_controller.dart';
import 'package:barber_user_app/view/screen/home/home_card_details/home_card_details_controller.dart';
import 'package:barber_user_app/view/screen/home/home_controller/home_controller.dart';
import 'package:barber_user_app/view/screen/makePayment/controller/make_payment_controller.dart';
import 'package:barber_user_app/view/screen/notification/notification_controller.dart';
import 'package:barber_user_app/view/screen/profile/profile_controller/profile_controller.dart';
import 'package:barber_user_app/view/screen/rate_service/rate_service_controller.dart';
import 'package:barber_user_app/view/screen/reschedule_appoinment/reschedule_appoinment_controller.dart';
import 'package:barber_user_app/view/screen/search/search_controller.dart';
import 'package:barber_user_app/view/screen/settings/controller/settings_controller.dart';
import 'package:get/get.dart';

class Dependancy extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => SignInController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => CategoryIndividualController(), fenix: true);
    Get.lazyPut(() => categoryIndividualListServiceController(), fenix: true);
    Get.lazyPut(() => IndividualDetailsController(), fenix: true);
    Get.lazyPut(() => HomeCardDetailsController(), fenix: true);
    Get.lazyPut(() => SettingsController(), fenix: true);
    Get.lazyPut(() => LocationController(), fenix: true);
    Get.lazyPut(() => NotificationController(), fenix: true);
    Get.lazyPut(() => BookAppoinmentController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => BookingRequestController(), fenix: true);
    Get.lazyPut(() => CatalougeDetailsController(), fenix: true);
    Get.lazyPut(() => CatalougeListController(), fenix: true);
    Get.lazyPut(() => SearchsController(), fenix: true);
    Get.lazyPut(() => CategoryController(), fenix: true);
    Get.lazyPut(() => MakePaymentController(), fenix: true);
    Get.lazyPut(() => BookingHistoryController(), fenix: true);
    Get.lazyPut(() => AppointmentController(), fenix: true);
    Get.lazyPut(() => RescheduleAppointMentController(), fenix: true);
    Get.lazyPut(() => RateServiceController(), fenix: true);
    Get.lazyPut(() => BookingDetailsController(), fenix: true);
  }
}