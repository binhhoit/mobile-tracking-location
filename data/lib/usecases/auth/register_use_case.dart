import 'package:injectable/injectable.dart';

import '../../repositories/user_repository.dart';
import '../base/use_case.dart';

@injectable
class RegisterUseCase extends UseCaseResult<bool> {
  final UserRepository _userRepository;

  RegisterUseCase(this._userRepository);

  @override
  Future<bool> execute({String email = "", String pass = ""}) async {
    return await _userRepository.registerWithGmail(email, pass);
  }
}
