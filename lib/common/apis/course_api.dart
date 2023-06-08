import 'package:online_learning_app/common/entities/course.dart';
import 'package:online_learning_app/common/utils/http_util.dart';

class CourseAPI{
  static Future<CourseListResponseEntity> courseList()async{
    var response = await HttpUtil().post('api/courseList');
    print(response);
    return CourseListResponseEntity.fromJson(response);

    
  }
    
  }
