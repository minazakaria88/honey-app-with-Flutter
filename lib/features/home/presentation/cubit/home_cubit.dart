import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind/features/home/data/models/home_model.dart';
import 'package:mind/features/home/data/repos/home_repo.dart';
import 'package:mind/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitState());

  final HomeRepo homeRepo;


  HomeModel ? homeModel;
  void getHomeData() async {
    var result = await homeRepo.getHomeData();
    result.fold(
      (failure) => emit(HomeErrorState(error: failure.error)),
      (model) {
        homeModel = model;
        emit(HomeSuccessState());
      },
    );
  }



  Future<void> getSearchData({required String value}) async {
    var result = await homeRepo.getSearchData(value: value);
    result.fold(
          (failure) => emit(SearchErrorState(error: failure.error)),
          (p) {
        products=p;
        emit(SearchSuccessState());
      },
    );
  }

  TextEditingController search=TextEditingController();
}
List<Products>  products=[];