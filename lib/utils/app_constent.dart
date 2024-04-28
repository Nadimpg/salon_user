class AppConstants {
  static String bearerToken = "BearerToken";
  static String userId = "UserId";
  static String onBoard = "Onboard";
  static String subscriptionType = "SubscriptionType";
  static String paymentDone = "paymentDone";
  static String profileID = "profileID";

  /// <-------------- All Response Message Static---------->
  static String successfull = "Request Successfull";
  static String error = "Oops, something went wrong";
  static String catID = "catID";
  static String providerID = "providerID";
  static String latitude = "latitude";
  static String longitude = "longitude";
  static String isSocialLogIn = "isSocialLogIn";

  static String isProviderAdded = "isProviderAdded";



  static String onlineImage =
      "https://img.freepik.com/free-photo/user-sign-icon-front-side-with-white-background_187299-40022.jpg?w=740&t=st=1705481431~exp=1705482031~hmac=89e2b2de749a608d27e73991f06a1e449c6e4ab8f8e9c74465b18ec415db010f";
  static String secretKey =
      "sk_test_51NiWAKHloEqm4Hcr2bW9Od8OZL1ySHO48NmyqgylSNkvRfp3GRAtAPcgr0EldrlZQ5QbnrdPDOTlI8UmIGxv11di00HWChl1wB";
}

/// otp screen type

enum OptScreenType { signupotp, forgotOtp }

enum ContentPermission { pendingCreator, creator, user }

enum Status { loading, error, completed, internetError }