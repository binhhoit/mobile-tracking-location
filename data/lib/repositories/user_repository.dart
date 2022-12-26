import 'package:data/model/failures/failure.dart';
import 'package:data/model/user/user.dart';
import 'package:fpdart/fpdart.dart';

abstract class UserRepository {
  Future<Either<List<User>, Failure>> getFollower(int page, int pageSize);
}