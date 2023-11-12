import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:route_e_commerce_app/home/home_secreen_ui/cubit/states.dart';
import '../../home_tab/ui/home_tab.dart';
import '../../products_tab/ui/view/products_tab.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates>{
  HomeScreenViewModel(): super(HomeScreenInitialState());
  int selectedIndex = 1;
  List tabs = [
    HomeTab(),
    ProductsTab(),
    Container(),
    Container(),
  ];
  void changeBottomNavigationBar(int newSelectedIndex){
   // emit(HomeScreenInitialState());
    selectedIndex = newSelectedIndex;
    emit(ChangeBottomNavigationBarState());
  }
}