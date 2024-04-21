import 'package:dio/dio.dart';
import 'package:mind/core/utils/api/end_points.dart';
class DioHelper
{
   final Dio dio;

  DioHelper({required this.dio}){
    dio.options
        ..baseUrl=EndPoints.baseUrl
        ..receiveDataWhenStatusError=true;
  }

  Future<Response> postData({
    required String path,
     Map<String,dynamic> ? query,
    Map<String,dynamic> ? headers,
    var data,
})async
  {
    return await dio.post(
      path,
      queryParameters:query,
      data: data,
      options: Options(
        headers: headers,
      ),

    );
  }

}