import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_app/auth/data/api/failures.dart';
import 'package:route_e_commerce_app/home/home_tab/domain/entities/CategoryEntity.dart';
import 'package:route_e_commerce_app/home/home_tab/domain/repository/home_remote_data_source.dart';
import '../../../../auth/data/api/api_manager.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryResponseEntity>> getAllCategories()async {
    var either = await  apiManager.getCategories();
    return either.fold(
            (l) => Left(Failures(errorMessage: l.errorMessage)),
            (response) => Right(response)
    );
  }
}
