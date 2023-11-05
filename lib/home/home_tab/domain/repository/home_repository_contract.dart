import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_app/home/home_tab/domain/entities/CategoryEntity.dart';

import '../../../../auth/data/api/failures.dart';

abstract class HomeRepositoryContract{
  Future <Either<Failures,CategoryResponseEntity>>getAllCategories();
}