import 'package:data/model/failures/failure.dart';
import 'package:data/model/user/user.dart';
import 'package:data/repositories/user_repository.dart';
import 'package:data/usecases/base/use_case.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFollowersUseCase extends UseCaseResult<Either<List<User>, Failure>> {
  final UserRepository _userRepository;

  GetFollowersUseCase(this._userRepository);

  @override
  Future<Either<List<User>, Failure>> execute({int page = 0, int pageSize = 10}) {
    return _userRepository.getFollower(page, pageSize);
  }
}
