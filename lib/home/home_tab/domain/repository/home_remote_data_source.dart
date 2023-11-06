import 'package:dartz/dartz.dart';

import '../../../../auth/data/api/failures.dart';
import '../entities/CategoryOrBrandEntity.dart';

abstract class HomeRemoteDataSource{
  Future <Either<Failures,CategoryOrBrandResponseEntity>>getAllCategories();
  Future <Either<Failures,CategoryOrBrandResponseEntity>>getAllBrands();
}
