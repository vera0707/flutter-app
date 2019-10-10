import 'package:dio/dio.dart';

class NetUtil{
  static Future<Map<String,dynamic>> get(String url,Map<String,dynamic> params) async{
    if(url != null && params != null && params.isNotEmpty){
      Response res = await Dio().get(url,queryParameters: params);
      return res.data;
    }
  }

  static Future<Map<String,dynamic>> post(String url,Map<String,dynamic> params) async{
    if(url != null && params != null && params.isNotEmpty){
      Response res = await Dio().get(url,queryParameters: params);
      return res.data;
    }
  }
}