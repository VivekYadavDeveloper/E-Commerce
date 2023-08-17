import 'dart:convert';
import 'package:futkart/constants/url.dart';
import 'package:futkart/model/get_reset_code_model.dart';
import 'package:futkart/model/get_user_id_model.dart';
import 'package:futkart/model/login_model.dart';
import 'package:futkart/model/reset_password_model.dart';
import 'package:futkart/model/sign_up_model.dart';
import 'package:futkart/model/validate_reset_code_model.dart';
import 'package:http/http.dart' as http;

import 'helper.dart';

class AuthApiServices {
  //** Register Api **/
  static Future<SignupModel> register(
      String name, String email, String phone, String pass) async {
    var url = baseurl + signup;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var headers = {
      'Authorization': basicAuth,
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var request = http.Request('POST', Uri.parse(url));
    request.body = json.encode({
      "email": email,
      "first_name": name,
      "last_name": "",
      "username": email,
      "password": pass,
      "billing": {
        "first_name": "",
        "last_name": "",
        "company": "",
        "address_1": "",
        "address_2": "",
        "city": "",
        "state": "",
        "postcode": "",
        "country": "",
        "email": email,
        "phone": phone
      },
      "shipping": {
        "first_name": "",
        "last_name": "",
        "company": "",
        "address_1": "",
        "address_2": "",
        "city": "",
        "state": "",
        "postcode": "",
        "country": ""
      }
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print(
        "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%          Register send API request");
    var data = jsonDecode(await response.stream.bytesToString());
    print(data);
    if (response.statusCode == 201) {
      return SignupModel.fromJson(data);
    } else {
      print("failed");
      return SignupModel.fromJson(data);
    }
  }

  //** Login and get token *//
  static Future<Login> loginTokenapi(String email, String password) async {
    var url = loginToken;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var headers = {
      'Authorization': basicAuth,
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var request = http.Request('POST', Uri.parse(url));
    print("////////////////////////////////////////////////////////////////");
    request.body = json.encode({"username": email, "password": password});
    print("login token api call");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var data = jsonDecode(await response.stream.bytesToString());
    print(data);
    if (response.statusCode == 200) {
      print("////////////////////////////////////////////////////");
      print(data);
      return Login.fromJson(data);
    } else {
      print("failed");
      return Login.fromJson(data);
    }
  }

  //////////////////////////////////////////////////////////////////////////      get user id
  static Future<List<GetUserIdModel>> getUserid(String email) async {
    var url = "https://futcart.com/wp-json/wc/v3/customers?email=" + email;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var headers = {
      'Authorization': basicAuth,
      'Content-Type': 'application/json',
    };
    var request = http.Request('Get', Uri.parse(url));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print("get user id api call");
    var data = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      print(data);
      return getUserIdModelFromJson(data);
    } else {
      print("failed");
      return getUserIdModelFromJson(data);
    }
  }

  /////////////////////////////////////////////////////////////     get reset code
  static Future<GetResetCodeModel> getResetCode(String email) async {
    var url = getresetcode;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var headers = {
      'Authorization': basicAuth,
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      // 'Cookie': 'woocommerce_current_currency=INR'
    };
    var request = http.Request('POST', Uri.parse(url));
    print("////////////////////////////////////////////////////////////////");
    request.body = json.encode({"email": email});
    print("get reset code api call");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    var data = jsonDecode(await response.stream.bytesToString());
    print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
    print(data);
    if (response.statusCode == 200) {
      print("////////////////////////////////////////////////////");
      print(data);
      return GetResetCodeModel.fromJson(data);
    } else {
      print("failed");
      return GetResetCodeModel.fromJson(data);
    }
  }

  /////////////////////////////////////////////////////////////     validate reset code
  static Future<ValidateResetCodeModel> validateResetCode(
      String email, String code) async {
    var url = validateresetcode;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var headers = {
      'Authorization': basicAuth,
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      // 'Cookie': 'woocommerce_current_currency=INR'
    };
    var request = http.Request('POST', Uri.parse(url));
    print("////////////////////////////////////////////////////////////////");
    request.body = json.encode({"email": email, "code": code});
    print("validate reset code api call");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    var data = jsonDecode(await response.stream.bytesToString());
    print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
    print(data);
    if (response.statusCode == 200) {
      print("////////////////////////////////////////////////////");
      print(data);
      return ValidateResetCodeModel.fromJson(data);
    } else {
      print("failed");
      return ValidateResetCodeModel.fromJson(data);
    }
  }

  /////////////////////////////////////////////////////////////     validate reset code
  static Future<ResetPasswordModel> resetPassword(
      String email, String code, String password) async {
    var url = resetpassword;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    var headers = {
      'Authorization': basicAuth,
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      // 'Cookie': 'woocommerce_current_currency=INR'
    };
    var request = http.Request('POST', Uri.parse(url));
    print("////////////////////////////////////////////////////////////////");
    request.body =
        json.encode({"email": email, "code": code, "password": password});
    print("validate reset code api call");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    var data = jsonDecode(await response.stream.bytesToString());
    print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");
    print(data);
    if (response.statusCode == 200) {
      print("////////////////////////////////////////////////////");
      print(data);
      return ResetPasswordModel.fromJson(data);
    } else {
      print("failed");
      return ResetPasswordModel.fromJson(data);
    }
  }

//////////////////////////////////////////////////      verify phone
//   static Future<VerifyPhoneModel> verifyphoneapi(String phone) async {
//     String? token = await UserPreferences.getUser();
//     // print(token);
//     var _data;
//     var url = baseurl + authconection + verifyMobileNumber;
//     http.StreamedResponse? response;
//     var headers = {
//       'Content-Type': 'application/json',
//       // 'Accept': 'application/json'
//     };
//     try {
//       var request = http.Request('PUT', Uri.parse(url));
//       request.body = json.encode({"token": token, "phone": phone});
//       request.headers.addAll(headers);
//       response = await request.send();
//     } catch (e) {
//       print(e.toString());
//     }
//     _data = jsonDecode(await response!.stream.bytesToString());
//     print("//////////////////////////////////////////////////////////");
//     print(_data);
//     print("//////////////////////////////////////////////////////////");
//     if (response.statusCode == 200) {
//       return VerifyPhoneModel.fromJson(_data);
//     } else {
//       print("failed");
//       return VerifyPhoneModel.fromJson(_data);
//     }
//   }

//   static Future<VerifyPhoneOtpModel> verifyphoneotpapi(String otp) async {
//     String? token = await UserPreferences.getUser();
//     var url = baseurl + authconection + verifyPhoneOtp;
//     http.StreamedResponse? response;
//     var headers = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json'
//     };
//     try {
//       var request = http.Request('PUT', Uri.parse(url));
//       request.body = json.encode({"token": token, "otp": otp});
//       request.headers.addAll(headers);
//       response = await request.send();
//     } catch (e) {
//       print(e.toString());
//     }
//     var _data = jsonDecode(await response!.stream.bytesToString());
//     if (response.statusCode == 200) {
//       // print(_data['message'].toString());
//       return VerifyPhoneOtpModel.fromJson(_data);
//     } else {
//       print("failed");
//       return VerifyPhoneOtpModel.fromJson(_data);
//     }
//   }

//   static Future<VerifyAccountModel> verifyaccount() async {
//     var url = baseurl + authconection + verifyuserDetails;
//     String? token = await UserPreferences.getUser();
//     http.StreamedResponse? response;
//     var headers = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json'
//     };
//     try {
//       var request = http.Request('POST', Uri.parse(url));
//       request.body = json.encode({"token": token});
//       request.headers.addAll(headers);
//       response = await request.send();
//     } catch (e) {
//       print(e.toString());
//     }
//     var _data = jsonDecode(await response!.stream.bytesToString());
//     if (response.statusCode == 200) {
//       print(_data['token'].toString());
//       print(_data['status_code'].toString());
//       return VerifyAccountModel.fromJson(_data);
//     } else {
//       // print("failed");
//       return VerifyAccountModel.fromJson(_data);
//     }
//   }

//   /////////////// Complete profile ///////////////////////////
//   static Future<CompleteProModel> completepro(String teamname, String dob,
//       String gender, String mobile, String email, String state) async {
//     var url = baseurl + authconection + createprofile;
//     String? token = await UserPreferences.getUser();
//     http.StreamedResponse? response;
//     var headers = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json'
//     };
//     print("api service api");
//     var request = http.Request('PUT', Uri.parse(url));
//     request.body = json.encode({
//       "team_name": teamname,
//       "date_of_birth": dob,
//       "gender": gender,
//       "phone": mobile,
//       "email": email,
//       "state": state,
//       "token": token
//     });
//     // request.headers.addAll(headers);
//     // http.StreamedResponse response = await request.send();
//     request.headers.addAll(headers);
//     response = await request.send();
//     var data = jsonDecode(await response.stream.bytesToString());
//     print("//////////////////////////////////////////////////////");
//     print(data);
//     if (response.statusCode == 200) {
//       return CompleteProModel.fromJson(data);
//     } else {
//       print("failed");
//       return CompleteProModel.fromJson(data);
//     }
//     // if (response.statusCode == 200) {
//     //   print("////////////////////////////////////////////////////");
//     //   return CompleteProModel.fromJson(data);
//     // } else {
//     //   print("failed");
//     //   return CompleteProModel.fromJson(data);
//     // }
//   }

//   ///////////////////////////////////////////////////////////////////////////////   bank account verification
//   static Future<BankModel> verifybankaccount(
//       String accountNo, String ifsc) async {
//     var url = baseurl + authconection + bankaccountverification;
//     http.StreamedResponse? response;
//     String? token = await UserPreferences.getUser();
//     var headers = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json'
//     };
//     try {
//       var request = http.Request('POST', Uri.parse(url));
//       request.body = json.encode(
//           {"token": token, "account_number": accountNo, "ifsc_code": ifsc});
//       request.headers.addAll(headers);
//       response = await request.send();
//     } catch (e) {
//       print(e.toString());
//     }
//     var _data = jsonDecode(await response!.stream.bytesToString());
//     if (response.statusCode == 200) {
//       print(_data['token'].toString());
//       print(_data['status_code'].toString());
//       return BankModel.fromJson(_data);
//     } else {
//       // print("failed");
//       return BankModel.fromJson(_data);
//     }
//   }

//   //////////////////////////////////////////////////////////////////////////   forgot password
//   static Future<ForgotPassModel> forgotPassword(String emailphone) async {
//     var url = baseurl + authconection + forgotpassword;
//     var headers = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json'
//     };
//     var request = http.Request('POST', Uri.parse(url));
//     request.body = json.encode({"email": emailphone});
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//     var data = jsonDecode(await response.stream.bytesToString());
//     if (response.statusCode == 200) {
//       print("////////////////////////////////////////////////////");
//       return ForgotPassModel.fromJson(data);
//     } else {
//       print("failed");
//       return ForgotPassModel.fromJson(data);
//     }
//   }

//   //////////////////////////////////////////////////////////////////////   New Password

//   static Future<NewPasswordModel> newPassword(
//       String email, String newpass, String otp) async {
//     var url = baseurl + authconection + recoverPassword;
//     var headers = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json'
//     };
//     var request = http.Request('PUT', Uri.parse(url));
//     request.body =
//         json.encode({"email": email, "password": newpass, "otp": otp});
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//     var data = jsonDecode(await response.stream.bytesToString());
//     if (response.statusCode == 200) {
//       // print("chal gya");
//       return NewPasswordModel.fromJson(data);
//     } else {
//       // print("failed");
//       return NewPasswordModel.fromJson(data);
//     }
//   }

//   //////////////////////////////////////////////////////////////////////   Change Password

//   static Future<ChangePasswordModel> changePassword(
//       String cpass, String npass, String token) async {
//     var url = baseurl + authconection + changepassword;
//     var headers = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json'
//     };
//     var request = http.Request('PUT', Uri.parse(url));
//     request.body = json.encode(
//         {"current_password": cpass, "new_password": npass, "token": token});
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//     var data = jsonDecode(await response.stream.bytesToString());
//     if (response.statusCode == 200) {
//       print("chal gya");
//       return ChangePasswordModel.fromJson(data);
//     } else {
//       print("failed");
//       return ChangePasswordModel.fromJson(data);
//     }
//   }

//   //////////////////////////////////////////////////////////////////////   Verify OTP register

//   static Future<RegisterOtpModel> otpRegister(
//       String otp, String email, String description) async {
//     var url = baseurl + authconection + verifyotpregistration;
//     var headers = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json'
//     };
//     var request = http.Request('POST', Uri.parse(url));
//     request.body =
//         json.encode({"otp": otp, "email": email, "description": description});
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//     var data = jsonDecode(await response.stream.bytesToString());
//     if (response.statusCode == 200) {
//       print("chal gya");
//       return RegisterOtpModel.fromJson(data);
//     } else {
//       print("failed");
//       return RegisterOtpModel.fromJson(data);
//     }
//   }

//   ///////////////////////////////////////////////////////////////////    verifyotp

//   static Future<VerifyOtpModel> verifyotp(
//       String otp, String email, String description) async {
//     var url = baseurl + authconection + verifyOtp;
//     var headers = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json'
//     };
//     var request = http.Request('POST', Uri.parse(url));
//     request.body =
//         json.encode({"otp": otp, "email": email, "description": description});
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//     var data = jsonDecode(await response.stream.bytesToString());
//     if (response.statusCode == 200) {
//       print("chal gya");
//       return VerifyOtpModel.fromJson(data);
//     } else {
//       print("failed");
//       return VerifyOtpModel.fromJson(data);
//     }
//   }

//   /////////////////////////////////////////////////////////    verifyemail
//   static Future<VerifyEmailModel> verifyemail(String email) async {
//     String? token = await UserPreferences.getUser();
//     // print(object)
//     var url = baseurl + authconection + verifyEmail;
//     http.StreamedResponse? response;
//     var headers = {
//       'Content-Type': 'application/json',
//       // 'Accept': 'application/json'
//     };
//     try {
//       var request = http.Request('PUT', Uri.parse(url));
//       request.body = json.encode({"token": token, "email": email});
//       request.headers.addAll(headers);
//       response = await request.send();
//     } catch (e) {
//       print(e.toString());
//     }
//     var _data = jsonDecode(await response!.stream.bytesToString());
//     print(
//         "///////////////////////////////////////////////////////////////////");
//     print(_data);
//     print(
//         "///////////////////////////////////////////////////////////////////");
//     if (response.statusCode == 200) {
//       return VerifyEmailModel.fromJson(_data);
//     } else {
//       print("failed");
//       return VerifyEmailModel.fromJson(_data);
//     }
//   }

//   ///////////////////////////////////////////////////////////////////////////////// verify email otp
//   static Future<VerifyEmailOtpModel> verifyemailotpapi(String otp) async {
//     String? token = await UserPreferences.getUser();
//     var url = baseurl + authconection + verifyEmailOtp;
//     http.StreamedResponse? response;
//     var headers = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json'
//     };
//     try {
//       var request = http.Request('PUT', Uri.parse(url));
//       request.body = json.encode({"token": token, "otp": otp});
//       request.headers.addAll(headers);
//       response = await request.send();
//     } catch (e) {
//       print(e.toString());
//     }
//     var _data = jsonDecode(await response!.stream.bytesToString());
//     if (response.statusCode == 200) {
//       return VerifyEmailOtpModel.fromJson(_data);
//     } else {
//       print("failed");
//       return VerifyEmailOtpModel.fromJson(_data);
//     }
//   }

//   //////////////////////////////////////////////////////////////////////////////  Pan verificatin
//   static Future<VerifyPanModel> panverification(String pan) async {
//     var url = baseurl + authconection + pancardverification;
//     String? token = await UserPreferences.getUser();
//     http.StreamedResponse? response;
//     var headers = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json'
//     };
//     try {
//       var request = http.Request('POST', Uri.parse(url));
//       request.body = json.encode({"pan_number": pan, "token": token});
//       request.headers.addAll(headers);
//       response = await request.send();
//     } catch (e) {
//       print(e.toString());
//     }
//     var _data = jsonDecode(await response!.stream.bytesToString());
//     if (response.statusCode == 200) {
//       return VerifyPanModel.fromJson(_data);
//     } else {
//       print("failed");
//       return VerifyPanModel.fromJson(_data);
//     }
//   }

//   ///////////////////////////////////////////////////////////////////////////  check user compelte completeProfile or not
//   static Future<CompleteProCheckModel> completecheck() async {
//     var url = baseurl + authconection + completeprocheck;
//     String? token = await UserPreferences.getUser();
//     http.StreamedResponse? response;
//     var headers = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json'
//     };
//     try {
//       var request = http.Request('GET', Uri.parse(url));
//       request.body = json.encode({"token": token});
//       request.headers.addAll(headers);
//       response = await request.send();
//     } catch (e) {
//       print(e.toString());
//     }
//     var _data = jsonDecode(await response!.stream.bytesToString());
//     if (response.statusCode == 200) {
//       return CompleteProCheckModel.fromJson(_data);
//     } else {
//       return CompleteProCheckModel.fromJson(_data);
//     }
//   }

// ///////////////////////////////////////////////////////////////////// get state
//   static Future<GetStateModel> stateApi() async {
//     var url = baseurl + authconection + states;
//     String? token = await UserPreferences.getUser();
//     http.StreamedResponse? response;
//     var headers = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json'
//     };
//     try {
//       var request = http.Request('GET', Uri.parse(url));
//       request.body = json.encode({"token": token});
//       request.headers.addAll(headers);
//       response = await request.send();
//     } catch (e) {
//       print(e.toString());
//     }
//     var _data = jsonDecode(await response!.stream.bytesToString());
//     if (response.statusCode == 200) {
//       return GetStateModel.fromJson(_data);
//     } else {
//       return GetStateModel.fromJson(_data);
//     }
//   }

//   /////////////////////////////////////////////////////////////////////       get ProfileData
//   static Future<ProfileDataModel> getProfileData() async {
//     var url = baseurl + authconection + getProfileDataRoute;
//     String? token = await UserPreferences.getUser();
//     print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//     print(token);
//     print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//     http.StreamedResponse? response;
//     var headers = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json'
//     };
//     try {
//       var request = http.Request('GET', Uri.parse(url));
//       request.body = json.encode({"token": token});
//       request.headers.addAll(headers);
//       response = await request.send();
//     } catch (e) {
//       print(e.toString());
//     }
//     var _data = jsonDecode(await response!.stream.bytesToString());
//     print(_data);
//     if (response.statusCode == 200) {
//       return ProfileDataModel.fromJson(_data);
//     } else {
//       return ProfileDataModel.fromJson(_data);
//     }
//   }

//   /////////////////////////////////////////////////////////////////////       get Avatar
//   static Future<AvatarModel> getavatar() async {
//     var url = baseurl + authconection + getProfileDataRoute;
//     String? token = await UserPreferences.getUser();
//     print(token);
//     http.StreamedResponse? response;
//     var headers = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json'
//     };
//     try {
//       var request = http.Request('GET', Uri.parse(url));
//       request.body = json.encode({"token": token});
//       request.headers.addAll(headers);
//       response = await request.send();
//     } catch (e) {
//       print(e.toString());
//     }
//     var _data = jsonDecode(await response!.stream.bytesToString());
//     if (response.statusCode == 200) {
//       return AvatarModel.fromJson(_data);
//     } else {
//       return AvatarModel.fromJson(_data);
//     }
//   }

//   /////////////////////////////////////////////////////////////////////  GoogleLogin
//   static Future<LoginResponseModel> googleLoginAPI(
//     String email,
//     String serverAuthCode,
//     String displayName,
//     String photoUrl,
//     String socialId,
//   ) async {
//     var url = baseurl + authconection + googleLogin;
//     var headers = {'Content-Type': 'application/json'};
//     var request = http.Request('POST', Uri.parse(url));
//     request.body = json.encode({
//       "email": email,
//       "serverAuthCode": serverAuthCode,
//       "id": socialId,
//       "displayName": displayName,
//       "photoUrl": photoUrl
//     });
//     request.headers.addAll(headers);

//     http.StreamedResponse response = await request.send();

//     var data = jsonDecode(await response.stream.bytesToString());
//     print(data);
//     if (response.statusCode == 200) {
//       print("////////////////////////////////////////////////////");
//       return LoginResponseModel.fromJson(data);
//     } else {
//       print("failed");
//       return LoginResponseModel.fromJson(data);
//     }
//   }

//   /////////////////////////////////////////////////////////////////////  GoogleLogin
//   static Future<LoginResponseModel> facebookLoginAPI(
//     String email,
//     String axisToken,
//     String dateOfBirth,
//     String fullName,
//   ) async {
//     var url = baseurl + authconection + facebookLogin;
//     var headers = {'Content-Type': 'application/json'};
//     var request = http.Request('POST', Uri.parse(url));
//     request.body = json.encode({
//       "email": email,
//       "axis_token": axisToken,
//       "date_of_birth": dateOfBirth,
//       "full_name": fullName
//     });
//     request.headers.addAll(headers);

//     http.StreamedResponse response = await request.send();

//     var data = jsonDecode(await response.stream.bytesToString());
//     if (response.statusCode == 200) {
//       print("////////////////////////////////////////////////////");
//       return LoginResponseModel.fromJson(data);
//     } else {
//       print("failed");
//       return LoginResponseModel.fromJson(data);
// }
// }
}
