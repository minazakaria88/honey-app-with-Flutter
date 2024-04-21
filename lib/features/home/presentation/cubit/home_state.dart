abstract class HomeState{}

class HomeInitState extends HomeState{}

class HomeSuccessState extends HomeState{}

class HomeErrorState extends HomeState{
  final String error;

  HomeErrorState({required this.error});
}

class SearchSuccessState extends HomeState{}

class SearchErrorState extends HomeState{
  final String error;

  SearchErrorState({required this.error});
}

class HomeLoadingState extends HomeState{}