import 'package:dartz/dartz.dart';
import '../../../api/failures.dart';
import '../entities/signin_response_entity.dart';

abstract class SignInRepositoryContract{
  Future<Either<Failures, SignInResponseEntity>> signIn(
      {required String email, required String password});
}