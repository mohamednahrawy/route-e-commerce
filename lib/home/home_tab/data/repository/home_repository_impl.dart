import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_app/auth/data/api/failures.dart';
import 'package:route_e_commerce_app/home/home_tab/domain/entities/CategoryOrBrandEntity.dart';
import 'package:route_e_commerce_app/home/home_tab/domain/repository/home_repository_contract.dart';
import '../../domain/repository/home_remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepositoryContract {
  HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories() {
    return remoteDataSource.getAllCategories();
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() {
    return remoteDataSource.getAllBrands();
  }
}
