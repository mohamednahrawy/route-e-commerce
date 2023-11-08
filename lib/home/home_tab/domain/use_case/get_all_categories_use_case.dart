import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_app/home/home_tab/domain/repository/home_repository_contract.dart';
import '../../../../api/failures.dart';
import '../entities/CategoryOrBrandEntity.dart';

class GetAllCategoryUseCase{
  //needs object of the repository
  HomeRepositoryContract repositoryContract;
  GetAllCategoryUseCase({required this.repositoryContract});

  Future<Either<Failures, CategoryOrBrandResponseEntity>> invoke(){
    return repositoryContract.getAllCategories();
  }
}
