import 'package:futkart/db/db_helper.dart';

import '../db/cart_db_model.dart';

class LocalFun{
List<CartDBModel>? cartList;
bool status = false; 
 Future<bool> ceckStatus(String pId) async {

   var datac = await DbHelper.dbhelper.getCartData();
   cartList = datac;
   for(int a=0; a <= cartList!.length; a++){
     if(pId == cartList![a].product_id){
       status = true;
       return true;
     } 
   }
   return false;
 }

}