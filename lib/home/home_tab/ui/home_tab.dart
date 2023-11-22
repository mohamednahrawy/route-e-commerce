import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_e_commerce_app/home/home_tab/ui/brands_section.dart';
import 'package:route_e_commerce_app/home/home_tab/ui/categories_section.dart';
import 'package:route_e_commerce_app/utils/app_colors.dart';

import '../domain/di.dart';
import 'announcement_section.dart';
import 'category_or_brand_item.dart';
import 'cubit/home_tab_states.dart';
import 'cubit/home_tab_view_model.dart';

class HomeTab extends StatelessWidget {
  HomeTabViewModel viewModel = HomeTabViewModel(
      getAllCategoryUseCase: injectGetAllCategoryUseCase(),
      getAllBrandsUseCase: injectGetAllBrandsUseCase());

  HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leadingWidth: 90.w, leading: Image.asset('assets/images/logo.png')),
        body: BlocBuilder<HomeTabViewModel, HomeTabStates>(
            bloc: viewModel
              ..getCategories()
              ..getBrands(),
            builder: (context, state) => viewModel.categoriesList.isEmpty &&
                    viewModel.brandsList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        AnnouncementSection(),
                        SizedBox(
                          height: 20.h,
                        ),
                        CategoriesSection(categoriesList: viewModel.categoriesList),
                       BrandsSection(brandsList: viewModel.brandsList)
                      ],
                    ),
                  )));
  }

}

// {
//   if (state is HomeTabBrandLoadingState) {
//     return const CircularProgressIndicator();
//   } else if (state is HomeTabBrandSuccessState) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           AnnouncementSection(),
//           SizedBox(
//             height: 20.h,
//           ),
//           SizedBox(
//             height: 330.h,
//             child: GridView.builder(
//               scrollDirection: Axis.horizontal,
//               gridDelegate:
//                   const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       mainAxisSpacing: 2,
//                       crossAxisSpacing: 2),
//               itemCount: viewModel.categoriesList.length,
//               itemBuilder: (BuildContext context, int index) =>
//                   CategoryItem(
//                       categoryEntity:
//                           viewModel.categoriesList[index]),
//             ),
//           )
//         ],
//       ),
//     );
//   } else {
//     return Center(
//         child: Container(
//       height: 80,
//       width: 80,
//       color: Colors.red,
//     ));
//   }
// }
