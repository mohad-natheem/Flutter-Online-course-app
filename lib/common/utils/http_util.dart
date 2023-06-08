import 'package:dio/dio.dart';
import 'package:online_learning_app/global.dart';

class HttpUtil{
  static final HttpUtil _instance= HttpUtil._internal();
  factory HttpUtil(){
    return _instance;
  }
  late Dio dio;
  HttpUtil._internal(){
    BaseOptions options = BaseOptions(
      baseUrl: 'http://192.168.29.151:8000/',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
      headers: {},
      contentType: "application/json: charset=utf-8",
      responseType: ResponseType.json
    );
    dio= Dio(options);
  }

  Future post(String path,{dynamic data,Map<String,dynamic>? queryParameters,Options? options}) async {
    Options requestOptions =options??Options();
    requestOptions.headers=requestOptions.headers??{};
    Map<String,dynamic>? authorization = getAuthorization();
    if(authorization!=null){
      requestOptions.headers!.addAll(authorization);
    }
    try {var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions
      );
    return response.data;}
    catch(e){
      print("Error retrieving data $e");
    }

  }
  Map<String,dynamic>? getAuthorization(){
    var headers=<String,dynamic>{};
    var access_token = Global.storageService.getUserToken();
    if(access_token.isNotEmpty){
      headers['Authorization']='Bearer $access_token';
    }
    return headers;

  }

}