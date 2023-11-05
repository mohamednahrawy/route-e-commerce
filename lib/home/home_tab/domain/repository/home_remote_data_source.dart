import 'package:dartz/dartz.dart';

import '../../../../auth/data/api/failures.dart';
import '../entities/CategoryEntity.dart';

abstract class HomeRemoteDataSource{
  Future <Either<Failures,CategoryResponseEntity>>getAllCategories();
}
