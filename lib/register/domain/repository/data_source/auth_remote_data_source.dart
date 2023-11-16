import 'package:dartz/dartz.dart';
import '../../../../../api/api_manager.dart';
import '../../../../../api/failures.dart';
import '../../../data/model/response/register_response.dart';
import '../../../data/repository/data_source/auth_remote_data_source_impl.dart';
import '../../entities/auth_result_entity.dart';

abstract class AuthRemoteDataSource {
  ///todo: includes only abstract function
  ///todo: use EntityModel in the domain and all its functions
  Future<Either<Failures,AuthResultEntity>> register(String name, String email, String password,
      String rePassword, String phone);
}

