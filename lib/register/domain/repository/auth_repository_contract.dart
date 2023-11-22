import 'package:dartz/dartz.dart';

import '../../../../api/failures.dart';
import '../entities/auth_result_entity.dart';

abstract class AuthRepositoryContract {
  ///todo: includes only abstract function
  Future<Either<Failures,AuthResultEntity>> register(String name, String email, String password,
      String rePassword, String phone);
}
