class ApiConstant {
  // static const baseUrl = "http://192.168.10.121:8000/";
  //static const baseUrl = "http://103.145.138.53:5000/";
  static const baseUrl = "http://143.198.100.240/";

  ///==============payment================
  static const paymentPublicKey =
      "FLWPUBK_TEST-b5bb5bbff5a355e6f0c070063af0f04b-X";
  //===================Auth=========================
  //=========Sign UP==========
  static const register = "api/register";
  static const verified = "api/verified";
  static const resendOtp = "api/resendOtp";

  //=========Sign IN==========
  static const login = "api/login";
  static const resetPassword = "api/reset-password";

  ///========= forget password =========
  static const forgetPass="api/getOtp";

  /// ===================Home Screen=========================
  static const showCategory = "api/show-category";
  static const featuredProviders = "api/user/home?";
  static const nearByProviders = "api/near/by/provider";


  /// ===================Profile=========================
  static const getProfile = "api/profile";
  static const profileUpdate = "api/profileUpdate";

  ///============= category individual ===============
    static const categoryIndividual="api/salon/list/";

    ///========== salon service
    static const categoryIndividualList="api/salon/service/";

    ///========== service details ==========
    static const serviceDetail="api/service/details/";

    ///======= salon details==========
    static const salonDetails="api/salon/details/";

  //===================Settings=========================
  static const logOut = "api/logout";
  static const changePassword = "api/change-password";
  static const aboutPrivacyTerms = "api/show-website-pages";

  //===================Home Screen=========================
  static const categorySearch = "api/category-search/";

  ///================== search =============
  static const searchSalon="api/salon-search-home/";
  static const filterSalon="api/user-filter/";

  ///============== book appoinment =============
  static const bookAppoinment="api/appoinments/booking/show/";
  static const postBooking="api/post/booking/";

  //===================Notification===============================
  static const notification = "api/user/booking/accept/notification";

  ///============= catalouge ========================
  static const catalougeList="api/catalog/";
  static const catalougeDetails="api/catalog/details/";

  ///================== social login ===============
  static const socialAuth = "api/social-login";

  ///================= booking request ===============
  static const bookingRequest = "api/user/booking/reequest";

  ///================= booking history ===============
  static const bookingHistory = "api/appointment/history";
  static const appoinments = "api/appoinments";

  ///===================Payment===============================
  static const makePayment = "api/user-pay/";
  static const paymentSuccess = "api/user-payment-success";


  static const myPlan = "api/my-plan";
  static const reSchedule = "api/re-schdule";

  ///=================== rating =======================
  static const saveRating = "api/saveRating";
  static const acceptBooking = "api/booking/accept/";

}