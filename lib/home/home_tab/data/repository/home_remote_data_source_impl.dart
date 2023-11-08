import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_app/home/home_tab/domain/entities/CategoryOrBrandEntity.dart';
import 'package:route_e_commerce_app/home/home_tab/domain/repository/home_remote_data_source.dart';

import '../../../../api/api_manager.dart';
import '../../../../api/failures.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories() {
    return  apiManager.getCategories();

  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() {
    return apiManager.getBrands();
  }
}
