import 'package:route_e_commerce_app/home/home_tab/domain/entities/CategoryEntity.dart';

abstract class HomeTabStates{}

class HomeTabInitialState extends HomeTabStates{}
class HomeTabLoadingState extends HomeTabStates{
  String? loadingMessage;
  HomeTabLoadingState({this.loadingMessage});
}
class HomeTabErrorState extends HomeTabStates{
  String? errorMessage;
  HomeTabErrorState({required this.errorMessage});
}
class HomeTabSuccessState extends HomeTabStates{
  //response - list
  CategoryResponseEntity responseEntity;
  HomeTabSuccessState({required this.responseEntity});
}