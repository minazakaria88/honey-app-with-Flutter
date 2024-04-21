import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind/core/utils/cache.dart';
import 'package:mind/features/login/data/models/login_model.dart';
import 'package:mind/features/login/data/repos/login_repo.dart';
import 'package:mind/features/login/presentation/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepo}) : super(LoginInitState());
  final LoginRepo loginRepo;

  late LoginModel loginModel;
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  var fromKey=GlobalKey<FormState>();
  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());
    var result = await loginRepo.login(email: email, password: password);
    result.fold((failure) => emit(LoginErrorState(error: failure.error)), (r) {
      loginModel=r;
      //CacheHelper.setData(key: 'auth', value: loginModel.authKey);
      emit(LoginSuccessState());
    });
  }
}
