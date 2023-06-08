import 'package:online_learning_app/common/entities/entities.dart';

import '../utils/http_util.dart';

class UserAPI{
  static login({LoginRequestEntity? params}) async {
    try{var response = await HttpUtil().post(
      'api/login',
      queryParameters:params?.toJson()
    );
    // print(response);
    return UserLoginResponseEntity.fromJson(response);}
  catch(e){
    print("Network error ${e}");
  }
  }
}