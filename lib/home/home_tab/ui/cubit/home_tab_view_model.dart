import 'package:bloc/bloc.dart';
import '../../domain/entities/CategoryOrBrandEntity.dart';
import '../../domain/use_case/get_all_brands_use_case.dart';
import '../../domain/use_case/get_all_categories_use_case.dart';
import 'home_tab_states.dart';

class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoryUseCase getAllCategoryUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;

  HomeTabViewModel(
      {required this.getAllCategoryUseCase,  required this.getAllBrandsUseCase})
      : super(HomeTabInitialState());

//data - handle logic
  List<CategoryOrBrandEntity> categoriesList = [];
  List<CategoryOrBrandEntity> brandsList = [];

  void getCategories() async {
    emit(HomeTabBrandLoadingState());
    var either = await getAllCategoryUseCase.invoke();
    either.fold((l) {
      emit(HomeTabBrandErrorState(errorMessage: l.errorMessage));
    }, (r) {
      categoriesList = r.data ?? [];
        emit(HomeTabBrandSuccessState(responseEntity: r));

    });
  }

  void getBrands() async {
    emit(HomeTabBrandLoadingState());
    var either = await getAllBrandsUseCase.invoke();
    either.fold((l) {
      emit(HomeTabBrandErrorState(errorMessage: l.errorMessage));
    }, (r) {
      brandsList = r.data ?? [];
        emit(HomeTabBrandSuccessState(responseEntity: r));
    });
  }
}
