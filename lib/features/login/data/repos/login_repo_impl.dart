import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mind/core/utils/api/dio_helper.dart';
import 'package:mind/core/utils/api/end_points.dart';
import 'package:mind/core/utils/errors.dart';
import 'package:mind/features/login/data/models/login_model.dart';
import 'package:mind/features/login/data/repos/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final DioHelper dioHelper;
  LoginRepoImpl({required this.dioHelper});
  @override
  Future<Either<Failure, LoginModel>> login(
      {required String email, required String password}) async {
    try {
      final formData=FormData.fromMap({
        'email': email,
        'password': password,
        'token':'asd342dsdddsd323dsdadasd3e',
        'platform':'1',
        'device_id':'bfghtr5yrtytd654e6trd',
      });
      var response = await dioHelper.postData(
        path: EndPoints.loginPath,
        headers: {
          EndPoints.headerAcceptLanguage:EndPoints.headerAcceptLanguageValue,
        },
        data: formData,
      );
      return right(LoginModel.fromJson(response.data['data']));
    } catch (e) {
      return left(Failure(error: e.toString()));
    }
  }
}
