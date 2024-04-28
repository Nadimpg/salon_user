class AppStaticStrings {
  //Auth
  static const atyose = "Atyose";
  static const name = "Name";
  static const enterfullname = "Enter full name";
  static const email = "Email";
  static const enteremail = "Enter email";
  static RegExp emailRegexp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static const String enterValidEmail = "Enter valid email";
  static const String fieldCantBeEmpty = "Field can't be empty";
  static const String passwordLength =
      "Password should be atleast 8 characters";
  static RegExp passRegExp = RegExp(r'(?=.*[a-zA-Z])(?=.*\d)');
  static const String passMustContainBoth =
      "'Password must contain both alphabets and numerics'";
  static const String passDoesNotMatch = "Password does not match";
  static const signUp = "Sign Up";
  static const conTiNue= "Continue";
  static const String passwordLengthAndContain =
      "Password must be 8 characters long & must include one capital letter";
}