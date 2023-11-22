import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_app/api/failures.dart';
import '../../../api/api_manager.dart';
import '../../domain/entities/signin_response_entity.dart';
import '../../domain/repository/signin_remote_data_source.dart';

class SignInRemoteDataSourceImpl implements SignInRemoteDataSource{
  ApiManager apiManager;
  SignInRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, SignInResponseEntity>> signIn({required String email, required String password})async {
    var response = await  apiManager.signIn(email: email, password: password);
    return response.fold(
            (l) => Left(Failures(errorMessage: l.errorMessage)),
            (response) => Right(response)
    );
  }
}