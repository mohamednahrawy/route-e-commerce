import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_e_commerce_app/home/home_tab/domain/di.dart';
import 'package:route_e_commerce_app/home/home_tab/ui/cubit/home_tab_view_model.dart';

import 'cubit/home_tab_states.dart';

class CategoriesSection extends StatefulWidget {

  CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  HomeTabViewModel viewModel =
      HomeTabViewModel(getAllCategoryUseCase: injectGetAllCategoryUseCase());
@override
  void initState() {
    super.initState();
    viewModel.getCategories();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
      bloc: viewModel,
      builder: (context, state){
        if(state is HomeTabLoadingState){
          return const CircularProgressIndicator();
        }else if(state is HomeTabSuccessState){
          return Center(child: Text(viewModel.categoriesList.length.toString()));
        }else{
          return Center(child: Container(height: 50,width: 50,color: Colors.red,));
        }
      }
    );
  }
}
// viewModel.categoriesList.isEmpty
//     ? Center(child: CircularProgressIndicator())
//     : Text(viewModel.categoriesList?.length.toString()?? '0')
// Container(
//         height: 200.h,
//         child: GridView.builder(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 16,
//                 crossAxisSpacing: 16),
//             itemBuilder: (context, index)=>Column(
//               children: [
//
//               ],
//             )
//         ));