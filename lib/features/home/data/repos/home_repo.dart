import 'package:dartz/dartz.dart';
import 'package:mind/core/utils/errors.dart';
import 'package:mind/features/home/data/models/home_model.dart';

abstract class HomeRepo{
  Future<Either<Failure,HomeModel>> getHomeData();
  Future<Either<Failure,List<Products>>> getSearchData({required String value});
}