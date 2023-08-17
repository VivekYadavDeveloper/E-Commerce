import 'package:shared_preferences/shared_preferences.dart';

// Share Preferences Class
class Helper {
// Write DATA
  static Future<bool> saveUserIdData(String value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString("token", value);
  }

// Read Data
  static Future<String> getUserIdData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // String? token = sharedPreferences.getString("token");
    String? token = (await sharedPreferences.getString("token")) ?? "";
    // return sharedPreferences.getString("token");
    return token;
  }

// delete token
  static Future<bool> deleteUserIdData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // String? tokenn = await sharedPreferences.getString("token");
    sharedPreferences.remove("token");
    return true;
  }
}
