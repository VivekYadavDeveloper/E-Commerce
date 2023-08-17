import 'package:futkart/model/login_model.dart';
import 'package:futkart/services/auth_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = true.obs;
  var aproduct = Login().obs;

  login(
    String email,
    String password,
  ) async {
    print("login controller is called");
    isLoading(true);
    try {
      var product = await AuthApiServices.loginTokenapi(email, password);
      if (product != null) {
        aproduct.value = product;
      }
    } finally {
      isLoading(false);
    }
  }
}
