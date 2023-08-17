import 'package:get/get.dart';

class TabCController extends GetxController {
  RxInt pindex = 0.obs;
  RxInt categ = 120.obs;


  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();

  // }

  void updatePage(int index, int category){
    // pindex = 1 as RxInt;
    pindex.value = index;
    categ.value = category;
    print("////////////////////////////////////////////////////////    controller called");
    print(categ.value);
  }


}