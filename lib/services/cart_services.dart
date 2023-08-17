import 'dart:convert';
import 'package:futkart/model/cart_model.dart';
import 'package:http/http.dart' as http;
import '../constants/url.dart';

class CartServices {


  ////////////////////////////////////////////////////////////////     get cart
  static Future<List<CartModel>?> getCartItemList() async {
    var url = "https://futcart.com/wp-json/ade-woocart/v1/cart";
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var headers = {
      'Authorization': basicAuth,
      'Content-Type': 'application/json',
    };
    var request = http.Request('GET', Uri.parse(url));
    print("////////////////////////////////////////////////////////////////");
    print("get cart item service api call");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    // var data = jsonDecode(await response.stream.bytesToString());
    var data = await response.stream.bytesToString();
    print(data);
    if (response.statusCode == 200) {
      print("////////////////////////////////////////////////////");
      return cartModelFromJson(data);
    } else {
      print("failed");
      return null;
    }
  }

  ////////////////////////////////////////////////////////////////     add item to cart
  static Future addItemToCart(
      // String pId, 
      // int quantity
    ) async {
    var url = "https://futcart.com/wp-json/ade-woocart/v1/cart";
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var headers = {
      'Authorization': basicAuth,
      'Accept': 'application/json',
      // 'Content-Type': 'application/json',
    };
    var request = http.Request('Post', Uri.parse(url));
    request.body = json.encode({
      {
        "product_id": "51942", 
        "quantity": 23
      }
    });
    print("////////////////////////////////////////////////////////////////");
    print("add item to cart service api call");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    // var data = jsonDecode(await response.stream.bytesToString());
    var data = await response.stream.bytesToString();
    // print(data);
    // if (response.statusCode == 200) {
    //   print("////////////////////////////////////////////////////");
    //   print("");
    //   // return cartModelFromJson(data);
    // } else {
    //   print("failed");
    //   // return null;
    // }
  }


   


}
