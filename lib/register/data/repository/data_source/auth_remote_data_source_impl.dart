import 'package:dartz/dartz.dart';

import '../../../../../api/api_manager.dart';
import '../../../../../api/failures.dart';
import '../../../domain/entities/auth_result_entity.dart';
import '../../../domain/repository/data_source/auth_remote_data_source.dart';



class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  ///todo: constructor injection
  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, AuthResultEntity>> register(String name,
      String email, String password,
      String rePassword, String phone) async {
    var either = await apiManager.register(
        name, email, password, rePassword, phone);
    return either.fold((l) {
      return Left(Failures(errorMessage: l.toString())) ;
    }, (response) {
      return Right(response!.toAuthResultEntity());
    });
  }
}
