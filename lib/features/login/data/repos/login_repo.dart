import 'package:dartz/dartz.dart';
import 'package:mind/core/utils/errors.dart';
import 'package:mind/features/login/data/models/login_model.dart';

abstract class LoginRepo
{
   Future<Either<Failure,LoginModel>> login({required String email,required String password});
}