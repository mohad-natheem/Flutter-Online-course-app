

import 'dart:convert';

import 'package:online_learning_app/common/entities/entities.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../values/constants.dart';

class StorageService{
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key,bool value)async{
    return await _prefs.setBool(key, value);
  }

  Future<bool> setString(String key,String value)async{
    return await _prefs.setString(key, value);
  }

  Future<bool> remove(String key){
    return _prefs.remove(key);
  }

  bool getDeviceFirstOpen(){
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME)??false;
  }

  bool isLoggedIn(){
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY)==null?false:true;
  }

  UserItem getUserProfile(){
    var profile = _prefs.getString(AppConstants.STORAGE_USER_PROFILE_KEY)??"";
    if(profile.isNotEmpty){
      return UserItem.fromJson(jsonDecode(profile));

    }
    return UserItem();
  }
  String getUserToken(){
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY)??"";
  }
}