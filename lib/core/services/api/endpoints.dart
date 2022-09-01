class Endpoints {
  static String baseURL = "https://v2-trofira-api.herokuapp.com";

  static String apiURL = "$baseURL/api";

  // auth
  static String signUp = "/auth/signup";
  static String signIn = "/auth/login";
  static String sendVerifyEmailOTP = "/auth/verify-email";
  static String sendForgotPasswordOTP = "/auth/recover-password";
  static String verifyOTP = "/auth/verify-otp";
  static String verifyForgotPasswordOTP = "/auth/recover-password";
  static String setNewPassword = "/auth/reset-password";
  static String logout = "/vendors/auth/login";

  // vendor profile
  static String getVendorProfileDetails = "/vendor/user";
  static String addVendorProfile = "/vendor";
  static String searchVendor = "/vendor";

  static String orders = "/vendor/orders";
  
  static String getDriverProfileDetails = "/driver";
}

//menu
 final  menuRoute = Endpoints.apiURL + '/menu-category';
