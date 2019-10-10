import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/model/user.dart';

class DataUtil {
  // 登录信息
  static const String SP_ACCESS_TOKEN = 'access_token';
  static const String SP_REFRESH_TOKEN = 'refresh_token';
  static const String SP_TOKEN_TYPE = 'token_type';
  static const String SP_EXPIRES_IN = 'expires_in';
  static const String SP_UID = 'uid';
  static const String SP_IS_LOGIN = 'isLogin';

  // 用户信息字段
  static const String SP_USER_ID = 'id';
  static const String SP_USER_EMAIL = 'email';
  static const String SP_USER_NAME = 'name';
  static const String SP_USER_GENDER = 'gender';
  static const String SP_USER_AVATAR = 'avatar';
  static const String SP_USER_LOCATION = 'location';
  static const String SP_USER_URL = 'URL';


  // 保存登录信息
  static Future<void> saveLoginInfo(Map<String,dynamic> map) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp
      ..setString(SP_ACCESS_TOKEN, map[SP_ACCESS_TOKEN])
      ..setString(SP_REFRESH_TOKEN, map[SP_REFRESH_TOKEN])
      ..setString(SP_TOKEN_TYPE, map[SP_TOKEN_TYPE])
      ..setInt(SP_EXPIRES_IN, map[SP_EXPIRES_IN])
      ..setInt(SP_UID, map[SP_UID])
      ..setBool(SP_IS_LOGIN, true);

    // 退出时 清除登录信息
    sp
      ..setString(SP_ACCESS_TOKEN, null)
      ..setString(SP_REFRESH_TOKEN, null)
      ..setString(SP_TOKEN_TYPE, null)
      ..setInt(SP_EXPIRES_IN, null)
      ..setInt(SP_UID, null)
      ..setBool(SP_IS_LOGIN, false); 
  }

  // 获取 token
  static Future<String> getAccessToken() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(SP_ACCESS_TOKEN) ?? '';
  }

  // 保存用户信息
  static Future saveUser(Map<String,dynamic> user) async{
    SharedPreferences sp = await SharedPreferences.getInstance();

    if(user != null && user.isNotEmpty){
      sp
        ..setString(SP_USER_ID, user[SP_USER_ID])
      ..setString(SP_USER_EMAIL, user[SP_USER_EMAIL])
      ..setString(SP_USER_NAME, user[SP_USER_NAME])
      ..setInt(SP_USER_GENDER, user[SP_USER_GENDER])
      ..setInt(SP_USER_AVATAR, user[SP_USER_AVATAR])
      ..setBool(SP_USER_LOCATION, user[SP_USER_LOCATION])
      ..setBool(SP_USER_URL, user[SP_USER_URL]);

      return User.fromJson(user);
    }

    return null;
  }

  static Future<bool> isLogin() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.getBool(SP_IS_LOGIN ?? false);
  }
}