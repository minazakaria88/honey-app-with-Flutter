/*import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences x;

  static Future<SharedPreferences> init() async {
    x = await SharedPreferences.getInstance();
    return x;
  }

  static void setData({
    required String key,
    required String value,
  }) {
    x.setString(key, value);
  }

  static String? getData({
    required String key,
  }) {
    return x.getString(key);
  }
}*/

String authKey='';
