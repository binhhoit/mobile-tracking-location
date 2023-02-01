import 'package:injectable/injectable.dart';

import '../../repositories/user_repository.dart';
import '../base/use_case.dart';

@injectable
class CheckLoginUseCase extends UseCaseResult<bool> {
  final UserRepository _userRepository;

  CheckLoginUseCase(this._userRepository);

  @override
  Future<bool> execute() async {
    return await _userRepository.isAuthentication();
  }
}
