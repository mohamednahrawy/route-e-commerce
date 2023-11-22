import 'package:dartz/dartz.dart';
import '../../../api/failures.dart';
import '../entities/GetCartResponseEntity.dart';

abstract class GetCartRemoteDataSource {
  Future<Either<Failures, GetCartResponseEntity>> getCart();
}
