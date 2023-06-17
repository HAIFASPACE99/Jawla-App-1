class ApiALl with AuthEndpoint, ConstApi, UserEndpoint {}

mixin ConstApi {
  String url = "0.0.0.0:8080";
}

mixin AuthEndpoint {
  String createAccount = "/auth/create_account";
  String loginAccount = "/auth/login";
  String forgetPassword = "/auth/forget_password";
  String updatePassword = "/auth/update_password";
}

mixin UserEndpoint {
  String displayActivity = "/user/display_all_activities";
  String favorite = "/user/add_favorite/";
}
