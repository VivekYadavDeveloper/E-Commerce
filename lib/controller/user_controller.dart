import 'package:futkart/model/user_data_model.dart';
import 'package:futkart/services/helper.dart';
import 'package:futkart/services/user_services.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  // int? productId;
  var isLoading = true.obs;
  var user = UserDataModel().obs;
  // String uid = await Helper.getUserIdData();

  @override
  void onInit() {
    // TODO: implement onInit
    Helper.getUserIdData().then((id) {
      return fetchUserData(id);
    });
    
    super.onInit();
  }

  void fetchUserData(String prodId) async {
    print("/////////////////////////////////////////////////////////////////////////");
    print("User data controller is called");
    isLoading(true);
    try{
      // String a =  await Helper.getTokenData() as String;
      // print("000000000000000000000000");
      // print(a);
      var product = await UserService.getUserData(prodId);
      // print(product!.length);
    if (product != null){
      user.value = product;
    }
    }
    finally {
      isLoading(false);
    }
  }
}