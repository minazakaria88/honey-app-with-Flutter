import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mind/core/utils/api/dio_helper.dart';
import 'package:mind/core/utils/api/end_points.dart';
import 'package:mind/core/utils/errors.dart';
import 'package:mind/features/home/data/models/home_model.dart';
import 'package:mind/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final DioHelper dioHelper;
  HomeRepoImpl({required this.dioHelper});
  @override
  Future<Either<Failure, HomeModel>> getHomeData() async {
    try {
      final formData = FormData.fromMap(
        {
          'auth_key':
              'xx508xx63817x7525x74g004x30706542858349x5x78f5xx34xnh468',
          'user_id': '9',
        },
      );
      var response = await dioHelper.postData(
        path: EndPoints.homePath,
        data: formData,
        headers: {
          EndPoints.headerAcceptLanguage: EndPoints.headerAcceptLanguageValue,
        },
      );

      return right(HomeModel.fromJson(response.data['data']));
    } catch (e) {
      return left(Failure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Products>>> getSearchData({required String value})async {
    List<Products> products=[];
    try {
      final formData = FormData.fromMap(
        {
          'auth_key':
          'xx508xx63817x7525x74g004x30706542858349x5x78f5xx34xnh468',
          'user_id': '1',
          'search_with':'home_types',
          'home_types':value,
          'item_count':'0',
          'limit':'30',
        },
      );
      var response = await dioHelper.postData(
        path: EndPoints.searchPath,
        data: formData,
        headers: {
          EndPoints.headerAcceptLanguage: EndPoints.headerAcceptLanguageValue,
        },
      );
      response.data['data'].forEach((e){
        products.add(Products.fromJson(e));
      });
      return right(products);
    } catch (e) {
      return left(Failure(error: e.toString()));
    }
  }
}
