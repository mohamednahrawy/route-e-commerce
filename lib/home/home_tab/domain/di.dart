import 'package:route_e_commerce_app/home/home_tab/data/repository/home_remote_data_source_impl.dart';
import 'package:route_e_commerce_app/home/home_tab/data/repository/home_repository_impl.dart';
import 'package:route_e_commerce_app/home/home_tab/domain/repository/home_remote_data_source.dart';
import 'package:route_e_commerce_app/home/home_tab/domain/repository/home_repository_contract.dart';
import 'package:route_e_commerce_app/home/home_tab/domain/use_case/get_all_brands_use_case.dart';
import 'package:route_e_commerce_app/home/home_tab/domain/use_case/get_all_categories_use_case.dart';
import '../../../api/api_manager.dart';

GetAllCategoryUseCase injectGetAllCategoryUseCase() {
  return GetAllCategoryUseCase(
      repositoryContract: injectHomeRepositoryContract());
}
GetAllBrandsUseCase injectGetAllBrandsUseCase() {
  return GetAllBrandsUseCase(
      repositoryContract: injectHomeRepositoryContract());
}

HomeRepositoryContract injectHomeRepositoryContract() {
  return HomeRepositoryImpl(remoteDataSource: injectHomeRemoteDataSource());
}

HomeRemoteDataSource injectHomeRemoteDataSource() {
  return HomeRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
