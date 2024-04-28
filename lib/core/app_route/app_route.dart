import 'package:barber_user_app/view/screen/auth/forget_password/forget_password.dart';
import 'package:barber_user_app/view/screen/auth/forget_password_otp/forget_password_otp_screen.dart';
import 'package:barber_user_app/view/screen/auth/otp/otp_screen.dart';
import 'package:barber_user_app/view/screen/auth/reset_password/reset_password_screen.dart';
import 'package:barber_user_app/view/screen/auth/sign_in/sign_in_screen.dart';
import 'package:barber_user_app/view/screen/auth/sign_up/sign_up_continue.dart';
import 'package:barber_user_app/view/screen/auth/sign_up/sign_up_screen.dart';
import 'package:barber_user_app/view/screen/book_appointmenmt/book_appointment.dart';
import 'package:barber_user_app/view/screen/booking_request/booking_request_screen.dart';
import 'package:barber_user_app/view/screen/booking_summery/booking_summery.dart';
import 'package:barber_user_app/view/screen/booking_details/booking_details.dart';
import 'package:barber_user_app/view/screen/booking_history/booking_history.dart';
import 'package:barber_user_app/view/screen/catalouge/catalouge_details/catalouge_details_screen.dart';
import 'package:barber_user_app/view/screen/catalouge/catalouge_list/catalouge_list_screen.dart';
import 'package:barber_user_app/view/screen/category/category_screen.dart';
import 'package:barber_user_app/view/screen/category_individual_list/category_individual_list.dart';
import 'package:barber_user_app/view/screen/category_individual_list/individual_details/individul_details.dart';
import 'package:barber_user_app/view/screen/category_individul/category_individul.dart';
import 'package:barber_user_app/view/screen/home/home_card_details/home_card_details.dart';
import 'package:barber_user_app/view/screen/nav_bar/nav_bar.dart';
import 'package:barber_user_app/view/screen/notification/notification_screen.dart';
import 'package:barber_user_app/view/screen/onboarding/onboarding_screen.dart';
import 'package:barber_user_app/view/screen/payment/payment_method.dart';
import 'package:barber_user_app/view/screen/profile/edit_profile/edit_profile_screen.dart';
import 'package:barber_user_app/view/screen/rate_service/rate_service.dart';
import 'package:barber_user_app/view/screen/reschedule_appoinment/reschedule_appoinment.dart';
import 'package:barber_user_app/view/screen/settings/about_us/about_us_screen.dart';
import 'package:barber_user_app/view/screen/settings/change_password/change_password_screen.dart';
import 'package:barber_user_app/view/screen/settings/privacy_policy/privacy_policy_screen.dart';
import 'package:barber_user_app/view/screen/settings/settings_screen.dart';
import 'package:barber_user_app/view/screen/settings/terms_conditions/terms_condition_screen.dart';
import 'package:barber_user_app/view/screen/splash_screen/splash_screen.dart';
import 'package:barber_user_app/view/screen/view_all/view_all_nearby.dart';
import 'package:barber_user_app/view/screen/view_all/view_all_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static const String splashscreen = "/splash_screen";
  static const String onboardingScreen = "/onboarding_screen";
  static const String signInScreen = "/sign_in_screen";
  static const String forgetPassScreen = "/forget_password";
  static const String otpScreen = "/otp_screen";
  static const String resetPassword = "/reset_password_screen";
  static const String signUpScreen = "/sign_up_screen";
  static const String signUpContinue = "/sign_up_continue";


  static const String navBar = "/nav_bar";

  static const String editProfile = "/edit_profile_screen";
  static const String settings = "/settings_screen";
  static const String changePassword = "/change_password_screen";
  static const String privacyPolicy = "/privacy_policy_screen";
  static const String termsCondition = "/terms_condition_screen";
  static const String aboutUs = "/about_us_screen";

  static const String bookingHistory = "/booking_history";
  static const String rateService = "/rate_service";
  static const String reScheduleAppointment = "/reschedule_appointment";
  static const String bookingDetails = "/booking_details";
  static const String choosePayment = "/payment_method";
  static const String makePayment = "/make_payment";

  static const String notification = "/notification_screen";
  static const String homeCardDetails = "/home_card_details";

  static const String viewAllScreen = "/view_all_screen";
  static const String categoryScreen = "/category_screen";
  static const String categoryIndividual = "/category_individual";
  static const String categoryIndividualList = "/category_individual_list";
  static const String individualDetails = "/individual_details";
  static const String bookAppointment = "/book-appointment";
  static const String bookingSummery = "/booking_summery";
  static const String forgetPasswordOtpScreen = "/forget_password_otp_screen";
  static const String viewAllNearBy = "/view_all_nearby";
  static const String catalougeDetailsScreen = "/catalouge_details_screen";
  static const String catalougeListScreen = "/catalouge_list_screen";
  static const String bookingRequestScreen = "/booking_request_screen";




  static List<GetPage> routes = [
    GetPage(name: splashscreen, page: () => const SplashScreen()),
    GetPage(name: onboardingScreen, page: () => const OnboardingScreen()),
    GetPage(name: signInScreen, page: () => const SignInScreen()),
    GetPage(name: forgetPassScreen, page: () =>  ForgetPassword()),
    GetPage(name: otpScreen, page: () =>  const OtpScreen()),
    GetPage(name: resetPassword, page: () =>   ResetPassword()),
    GetPage(name: signUpScreen, page: () =>  const SignUpScreen()),
    GetPage(name: signUpContinue, page: () =>  const SignUpContinue()),

    GetPage(name: navBar, page: () =>  const NavBar()),

    GetPage(name: editProfile, page: () =>  const EditProfile()),
    GetPage(name: settings, page: () =>  const SettingsScreen()),
    GetPage(name: changePassword, page: () =>   const ChangePasswordScreen()),
    GetPage(name: privacyPolicy, page: () =>   PrivacyPolicy()),
    GetPage(name: termsCondition, page: () =>   TermsCondition()),
    GetPage(name: aboutUs, page: () =>   AboutUs()),
    GetPage(name: bookingHistory, page: () =>    const BookingHistory()),
    GetPage(name: rateService, page: () => RateService()),
    GetPage(name: reScheduleAppointment, page: () =>  const ReScheduleAppointment()),
    GetPage(name: bookingDetails, page: () =>  const BookingDetails()),
    GetPage(name: choosePayment, page: () =>  const ChoosePaymentMethod()),

    GetPage(name: notification, page: () =>   NotificationScreen()),
    GetPage(name: homeCardDetails, page: () =>  const HomeCardDetails()),





    GetPage(name: viewAllScreen, page: () =>  const ViewAllScreen()),
    GetPage(name: categoryScreen, page: () =>   const CategoryScreen()),
    GetPage(name: categoryIndividual, page: () =>  const CategoryIndividual()),
    GetPage(name: categoryIndividualList, page: () =>    CategoryIndividualList()),
    GetPage(name: individualDetails, page: () =>    const IndividualDetails()),
    GetPage(name: bookAppointment, page: () =>  const BookAppointment()),
    GetPage(name: bookingSummery, page: () =>       BookingSummery()),
    GetPage(name: forgetPasswordOtpScreen, page: () =>  const ForgetPasswordOtpScreen()),
    GetPage(name: viewAllNearBy, page: () =>  const ViewAllNearBy()),
    GetPage(name: catalougeDetailsScreen, page: () =>  const CatalougeDetailsScreen()),
    GetPage(name: catalougeListScreen, page: () =>  const CatalougeListScreen()),
    GetPage(name: bookingRequestScreen, page: () =>  const BookingRequestScreen()),


  ];
}