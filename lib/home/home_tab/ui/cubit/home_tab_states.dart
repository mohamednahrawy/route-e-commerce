import 'package:route_e_commerce_app/home/home_tab/domain/entities/CategoryOrBrandEntity.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class HomeTabCategoryLoadingState extends HomeTabStates {
  String? loadingMessage;

  HomeTabCategoryLoadingState({this.loadingMessage});
}

class HomeTabCategoryErrorState extends HomeTabStates {
  String? errorMessage;

  HomeTabCategoryErrorState({required this.errorMessage});
}

class HomeTabCategorySuccessState extends HomeTabStates {
  //response - list
  CategoryOrBrandResponseEntity responseEntity;

  HomeTabCategorySuccessState({required this.responseEntity});
}

class HomeTabBrandLoadingState extends HomeTabStates {
  String? loadingMessage;

  HomeTabBrandLoadingState({this.loadingMessage});
}

class HomeTabBrandErrorState extends HomeTabStates {
  String? errorMessage;

  HomeTabBrandErrorState({required this.errorMessage});
}

class HomeTabBrandSuccessState extends HomeTabStates {
  //response - list
  CategoryOrBrandResponseEntity responseEntity;

  HomeTabBrandSuccessState({required this.responseEntity});
}
