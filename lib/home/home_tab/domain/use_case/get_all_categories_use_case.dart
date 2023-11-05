import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_app/home/home_tab/domain/repository/home_repository_contract.dart';
import '../../../../auth/data/api/failures.dart';
import '../entities/CategoryEntity.dart';

class GetAllCategoryUseCase{
  //needs object of the repository
  HomeRepositoryContract repositoryContract;
  GetAllCategoryUseCase({required this.repositoryContract});

  Future<Either<Failures, CategoryResponseEntity>> invoke(){
    return repositoryContract.getAllCategories();
  }
}
