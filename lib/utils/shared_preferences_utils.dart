import 'package:shared_preferences/shared_preferences.dart';

class  SharedPreferenceUtils{
  static late SharedPreferences sharedPreferences;
  static init()async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
  ///todo: its void function so we made the return type bool to check on the void is done or not
  static Future<bool> saveData({required String key, dynamic value}){
    if(value is int){
     return sharedPreferences.setInt(key, value);
    }else if(value is double){
     return sharedPreferences.setDouble(key, value);
    }else if(value is String){
      return sharedPreferences.setString(key, value);
    }else{
     return sharedPreferences.setBool(key, value);
    }
  }
  static String? getData(String key){
    return sharedPreferences.getString(key);
  }

}