import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mind/core/utils/api/dio_helper.dart';
import 'package:mind/features/home/data/repos/home_repo_impl.dart';
import 'package:mind/features/home/presentation/cubit/home_cubit.dart';
import 'package:mind/features/login/data/repos/login_repo.dart';
import 'package:mind/features/login/data/repos/login_repo_impl.dart';
import 'package:mind/features/login/presentation/cubit/login_cubit.dart';

import 'features/home/data/repos/home_repo.dart';
final s1 = GetIt.instance;

Future<void> setupServiceLocator()async
{
  s1.registerLazySingleton(() => LoginCubit(loginRepo: s1()));

  s1.registerLazySingleton<LoginRepo>(() => LoginRepoImpl(dioHelper: s1()));

  s1.registerLazySingleton(() => DioHelper(dio: Dio()));

  s1.registerLazySingleton(() => HomeCubit(homeRepo: s1()));

  s1.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(dioHelper: s1()));

}
