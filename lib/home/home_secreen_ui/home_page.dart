import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_e_commerce_app/utils/app_colors.dart';

import 'cubit/home_secreen_view_model.dart';
import 'cubit/states.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'home-page';
  final HomeScreenViewModel viewModel = HomeScreenViewModel();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenViewModel, HomeScreenStates>(
        bloc: viewModel,
        listener: (context, state) {},
        builder: (context, state) {
          return StreamBuilder<ConnectivityResult>(
              stream: Connectivity().onConnectivityChanged,
              builder: (context, snapshot) {
                return Scaffold(
                  body: snapshot.data == ConnectivityResult.none
                      ? const Center(
                          child: Text('please, check internet connectivity'))
                      : viewModel.tabs[viewModel.selectedIndex],
                  bottomNavigationBar: buildBottomNavigationBar(context),
                );
              });
        });
  }

  buildBottomNavigationBar(context) => ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Theme.of(context).primaryColor,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            currentIndex: viewModel.selectedIndex,
            onTap: (index) {
              viewModel.changeBottomNavigationBar(index);
            },
            items: [
              BottomNavigationBarItem(
                  label: '',
                  icon: CircleAvatar(
                    radius: 20.r,
                    foregroundColor: viewModel.selectedIndex == 0
                        ? AppColors.primaryColor
                        : AppColors.whiteColor,
                    backgroundColor: viewModel.selectedIndex == 0
                        ? AppColors.whiteColor
                        : Colors.transparent,
                    child: ImageIcon(
                        size: 40.sp,
                        const AssetImage('assets/images/home_unselected.png')),
                  )),
              BottomNavigationBarItem(
                  label: '',
                  icon: CircleAvatar(
                    foregroundColor: viewModel.selectedIndex == 1
                        ? AppColors.primaryColor
                        : AppColors.whiteColor,
                    backgroundColor: viewModel.selectedIndex == 1
                        ? AppColors.whiteColor
                        : Colors.transparent,
                    radius: 20.r,
                    child: ImageIcon(
                        size: 40.sp,
                        const AssetImage('assets/images/heart_unselected.png')),
                  )),
              BottomNavigationBarItem(
                  label: '',
                  icon: CircleAvatar(
                    foregroundColor: viewModel.selectedIndex == 2
                        ? AppColors.primaryColor
                        : AppColors.whiteColor,
                    backgroundColor: viewModel.selectedIndex == 2
                        ? AppColors.whiteColor
                        : Colors.transparent,
                    radius: 20.r,
                    child: ImageIcon(
                        size: 40.sp,
                        const AssetImage(
                            'assets/images/profile_unselected.png')),
                  )),
              BottomNavigationBarItem(
                  label: '',
                  icon: CircleAvatar(
                    foregroundColor: viewModel.selectedIndex == 3
                        ? AppColors.primaryColor
                        : AppColors.whiteColor,
                    backgroundColor: viewModel.selectedIndex == 3
                        ? AppColors.whiteColor
                        : Colors.transparent,
                    radius: 20.r,
                    child: ImageIcon(
                        size: 40.sp,
                        const AssetImage('assets/images/home_unselected.png')),
                  )),
            ]),
      );
}
