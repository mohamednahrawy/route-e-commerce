import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_app/auth/data/api/failures.dart';
import '../../domain/entities/CategoryEntity.dart';
import '../../domain/use_case/get_all_categories_use_case.dart';
import 'home_tab_states.dart';

class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoryUseCase getAllCategoryUseCase;

  HomeTabViewModel({required this.getAllCategoryUseCase})
      : super(HomeTabInitialState());

//data - handle logic
  List<CategoryEntity> categoriesList =[];
  void getCategories() async {
    emit(HomeTabLoadingState());
    var either = await getAllCategoryUseCase.invoke();
    either.fold(
            (l) {
              emit(HomeTabErrorState(errorMessage: l.errorMessage));
              // Left(Failures(errorMessage: l.errorMessage));
            },
        (response) {
              categoriesList = response.data?? [];
              emit(HomeTabSuccessState(responseEntity: response));
             }
             );
  }
}
