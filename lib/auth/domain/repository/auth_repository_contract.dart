import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_app/auth/domain/entities/auth_result_entity.dart';

import '../../../api/failures.dart';

abstract class AuthRepositoryContract {
  ///todo: includes only abstract function
  Future<Either<Failures,AuthResultEntity>> register(String name, String email, String password,
      String rePassword, String phone);
}
