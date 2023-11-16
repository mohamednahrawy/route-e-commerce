import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_app/api/failures.dart';
import 'package:route_e_commerce_app/login/domain/entities/signin_response_entity.dart';
import 'package:route_e_commerce_app/login/domain/repository/signin_remote_data_source.dart';

import '../../../api/api_manager.dart';

class SignInRemoteDataSourceImpl implements SignInRemoteDataSource{
  ApiManager apiManager;
  SignInRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, SignInResponseEntity>> signIn({required String email, required String password})async {
    var response = await  apiManager.signIn(email: email, password: password);
    return response.fold(
            (l) => Left(Failures(errorMessage: l.errorMessage)),
            (r) => Right(r.toEntity())
    );
  }
}