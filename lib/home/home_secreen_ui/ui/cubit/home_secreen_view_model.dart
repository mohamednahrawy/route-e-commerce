import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:route_e_commerce_app/home/home_secreen_ui/ui/cubit/states.dart';
import '../../../home_tab/ui/home_tab.dart';
import '../../../products_tab/ui/view/products_tab.dart';
import '../../../profile_tab/ui/view/profile_tab_screen.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  HomeScreenViewModel() : super(HomeScreenInitialState());
  int selectedIndex = 3;
  List tabs = [
    HomeTab(),
    ProductsTab(),
    Container(),
    ProfileTab(),
  ];

  void changeBottomNavigationBar(int newSelectedIndex) {
    // emit(HomeScreenInitialState());
    selectedIndex = newSelectedIndex;
    emit(ChangeBottomNavigationBarState());
  }
}
