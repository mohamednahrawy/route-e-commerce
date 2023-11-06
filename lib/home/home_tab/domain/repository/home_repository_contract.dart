import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_app/home/home_tab/domain/entities/CategoryOrBrandEntity.dart';

import '../../../../auth/data/api/failures.dart';

abstract class HomeRepositoryContract{
  Future <Either<Failures,CategoryOrBrandResponseEntity>>getAllCategories();
  Future <Either<Failures,CategoryOrBrandResponseEntity>>getAllBrands();
}