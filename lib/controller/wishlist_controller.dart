import 'package:futkart/db/db_helper.dart';
import 'package:futkart/db/db_helper_model.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  // var user = DbHelperModel().obs;
  var isLoading = true.obs;
  var removeLoading = true.obs;
  RxList<DbHelperModel> wishList = (List<DbHelperModel>.of([])).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getWhishlist();
    super.onInit();
  }



  void addToWhishlist(
      String pId,
      String pName,
      String pCartSize,
      String pPrice,
      String pImgurl
    ) async {
    print(
        "/////////////////////////////////////////////////////////////////////////");
    print("wishlist controller is called");
    DbHelper.dbhelper.insertData(
        {
          DbHelper.columnProductId: pId, 
          DbHelper.columnProductName: pName,
          DbHelper.columnProductCartonSize: pCartSize,
          DbHelper.columnProductPrice: pPrice,
          DbHelper.columnProductImgUrl: pImgurl,

        }).then((value) {
      print("data added");
    }).onErorr((error, stackTrace) {
      print(error.toString());
    });
  }

  void getWhishlist() async {
    print(
        "/////////////////////////////////////////////////////////////////////////");
    print("wishlist controller is called");
    isLoading(true);
    try {
      var datac = await DbHelper.dbhelper.getData();
      wishList.value = datac;
       print(datac);
    } 
    finally {
      isLoading(false);
    }
    // data = DbHelperModel.fromJson(data as Map<String, dynamic>) as List<Map<String, dynamic>>;
  }



  void removeWhishlist(String id) async {
    print("/////////////////////////////////////////////////////////////////////////");
    print("wishlist controller is called");
    removeLoading(true);
    try {
      var datac = await DbHelper.dbhelper.deleteData(id);
      print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
      print(datac);
      getWhishlist();
      
    } 
    finally {
      removeLoading(false);
    }
    // data = DbHelperModel.fromJson(data as Map<String, dynamic>) as List<Map<String, dynamic>>;
  }
}
