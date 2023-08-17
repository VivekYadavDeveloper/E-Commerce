import 'dart:convert';
import 'package:futkart/constants/url.dart';
import 'package:futkart/db/cart_db_model.dart';
import 'package:futkart/model/order_list_model.dart';
import 'package:futkart/model/product_list_model.dart';
import 'package:futkart/model/user_data_model.dart';
import 'package:http/http.dart' as http;

class OrderService {
  ////////////////////////////////////////////////////////////////     get order list
  static Future<List<OrderListModel>?> getOrderList(
    String userId,
  ) async {
    var url = baseurl + orderlistUrl + userId;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var headers = {
      'Authorization': basicAuth,
      'Content-Type': 'application/json',
    };
    var request = http.Request('GET', Uri.parse(url));
    print("////////////////////////////////////////////////////////////////");
    print("get order api call");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    // var data = jsonDecode(await response.stream.bytesToString());
    var data = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      print(
          "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
      print(data);
      return orderListModelFromJson(data);
    } else {
      print("failed");
      return null;
    }
  }

  ////////////////////////////////////////////////////////////////     createOrder
  static Future<void> createOrder(String userId, UserDataModel userData,
      List<CartDBModel> cartData, String transId) async {
    var url = baseurl + orderlistUrl + userId;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var headers = {
      'Authorization': basicAuth,
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var request = http.Request('POST', Uri.parse(url));
    print(
        "ORDER<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>..");
        final peopleJson = cartData.map((p) => p.toJson()).toList();
    final jsonString = jsonEncode(peopleJson);
    print(peopleJson);
    request.body = json.encode({
      "payment_method": "bacs",
      "payment_method_title": "Direct Bank Transfer",
      "set_paid": true,
      "transaction_id": transId,
      "customer_id": userId,
      "billing": {
        "first_name": userData.billing!.firstName,
        "last_name": "",
        "address_1": userData.billing!.address1,
        "address_2": userData.billing!.address2,
        "city": userData.billing!.city,
        "state": userData.billing!.state,
        "postcode": userData.billing!.postcode,
        // "country": userData.billing!.country,
        "email": userData.billing!.email,
        "phone": userData.billing!.phone
      },
      "shipping": {
        "first_name": userData.shipping!.firstName,
        "last_name": "",
        "address_1": userData.shipping!.address1,
        "address_2": userData.shipping!.address2,
        "city": userData.shipping!.city,
        "state": userData.shipping!.state,
        "postcode": userData.shipping!.postcode,
        "country": userData.shipping!.country
      },
      "line_items": peopleJson,
      "shipping_lines": [
        {
          "method_id": "flat_rate",
          "method_title": "Flat Rate",
          "total": "10.00"
        }
      ]
    });
    print("////////////////////////////////////////////////////////////////");
    print("create order api call");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    // var data = jsonDecode(await response.stream.bytesToString());
    var data = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      print(
          "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
      print(data);
      // return orderListModelFromJson(data);
    } else {
      print("failed");
      // return null;
    }
  }

  ///////////////////////////////////////////////////////////////////////    update order Status/ cancle order
  static Future<void> cancleOrder(String orderId, String status) async {
    var url = "https://futcart.com/wp-json/wc/v3/orders/" + orderId;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var headers = {
      'Authorization': basicAuth,
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var request = http.Request('PUT', Uri.parse(url));
    request.body = json.encode({"status": status});
    print("////////////////////////////////////////////////////////////////");
    print("cancle order api call");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    // var data = jsonDecode(await response.stream.bytesToString());
    var data = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      print(
          "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
      print(data);
      // return orderListModelFromJson(data);
    } else {
      print("failed");
      // return null;
    }
  }
}
