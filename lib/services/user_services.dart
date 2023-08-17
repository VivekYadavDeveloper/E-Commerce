import 'dart:convert';
import 'package:futkart/constants/url.dart';
import 'package:futkart/model/user_data_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  //////////////////////////////////////////////////////////////////////////    get User data
  static Future<UserDataModel?> getUserData(String userId) async {
    var url = baseurl + userdata + userId.toString();
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var headers = {
      'Authorization': basicAuth,
      'Content-Type': 'application/json',
    };
    var request = http.Request('GET', Uri.parse(url));
    print("////////////////////////////////////////////////////////////////");
    print("User api call");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print("////////////////////////////////////////////////////////////////");
    var data = jsonDecode(await response.stream.bytesToString());
    // print(data);
    // var data = await response.stream.bytesToString();
    // print(data);
    if (response.statusCode == 200) {
      print(
          "******************************************************************");
      print(data);
      return UserDataModel.fromJson(data);
    } else {
      print("failed");
      return null;
    }
  }


  /////////////////////////////////////////////////////////////////////////////////    add address
  static Future<UserDataModel?> editBillingAdd(
    String userId,
    String? f_name,
    String? l_name,
    String? add_1,
    String? add_2,
    String? city,
    String? postcode,
    String? country,
    String? state,
    String? phone,
    
    ) async {
    var url = baseurl + userdata + userId;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var headers = {
      'Authorization': basicAuth,
      'Content-Type': 'application/json',
    };
    var request = http.Request('PUT', Uri.parse(url));
    print("////////////////////////////////////////////////////////////////");
    print("edit billing eddress api call");
    request.headers.addAll(headers);
    request.body = json.encode({
      
      "billing": {
        "first_name": f_name,
        "last_name": l_name,
        "company": country,
        "address_1": add_1,
        "address_2": add_2,
        "city": city,
        "postcode": postcode,
        "country": country,
        "state": state,
        "phone": phone
      }
      
    });
    http.StreamedResponse response = await request.send();
    print("////////////////////////////////////////////////////////////////");
    var data = jsonDecode(await response.stream.bytesToString());
    // print(data);
    // var data = await response.stream.bytesToString();
    // print(data);
    if (response.statusCode == 200) {
      print(
          "*********************************** billing add updated  *******************************");
      print(data);
      return UserDataModel.fromJson(data);
    } else {
      print("failed");
      return null;
    }
  }




  ///////////////////////////////////////////////////////////////    edit billing address
  static Future<UserDataModel?> addAddress(
    String userId,
    String? f_name,
    String? l_name,
    String? add_1,
    String? add_2,
    String? city,
    String? postcode,
    String? country,
    String? state
    ) async {
    var url = baseurl + userdata + userId;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var headers = {
      'Authorization': basicAuth,
      'Content-Type': 'application/json',
    };
    var request = http.Request('PUT', Uri.parse(url));
    print("////////////////////////////////////////////////////////////////");
    print("edit billing eddress api call");
    request.headers.addAll(headers);
    request.body = json.encode({
      "billing": {
        // "first_name": f_name,
        // "last_name": l_name,
        "company": "",
        "address_1": add_1,
        "address_2": add_2,
        "city": city,
        "state": state,
        "postcode": postcode,
        "country": "",
      },
      "shipping": {
        // "first_name": f_name,
        // "last_name": l_name,
        "company": "",
        "address_1": add_1,
        "address_2": add_2,
        "city": city,
        "state": state,
        "postcode": postcode,
        "country": ""
      }
    });
    http.StreamedResponse response = await request.send();
    print("////////////////////////////////////////////////////////////////");
    var data = jsonDecode(await response.stream.bytesToString());
    // print(data);
    // var data = await response.stream.bytesToString();
    // print(data);
    if (response.statusCode == 200) {
      print("*********************************** billing add updated  *******************************");
      print(data);
      return UserDataModel.fromJson(data);
    } else {
      print("failed");
      return null;
    }
  }



  //////////////////////////////////////////////////////////////    edit shipping address
  static Future<UserDataModel?> editShippingAdd(
    String userId,
    String? f_name,
    String? l_name,
    String? add_1,
    String? add_2,
    String? city,
    String? postcode,
    String? country,
    String? state,
    String? phone
    ) async {
    var url = baseurl + userdata + userId;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var headers = {
      'Authorization': basicAuth,
      'Content-Type': 'application/json',
    };
    var request = http.Request('PUT', Uri.parse(url));
    print("////////////////////////////////////////////////////////////////");
    print("edit shipping eddress api call");
    request.headers.addAll(headers);
    request.body = json.encode({
      "shipping": {
        "first_name": f_name,
        "last_name": l_name,
        "company": country,
        "address_1": add_1,
        "address_2": add_2,
        "city": city,
        "postcode": postcode,
        "country": country,
        "state": state,
        "phone": phone
      }
    });
    http.StreamedResponse response = await request.send();
    print("//////////////////////////////////////////////////////////////////////////////////////////");
    var data = jsonDecode(await response.stream.bytesToString());
    // print(data);
    // var data = await response.stream.bytesToString();
    // print(data);
    if (response.statusCode == 200) {
      print("*********************************** shipping add updated  *******************************");
      print(data);
      return UserDataModel.fromJson(data);
    } else {
      print("failed");
      return null;
    }
  }


}
