import 'package:data/usecases/user/get_followers_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  GetFollowersUseCase authenticationUseCase;

  LoginBloc(this.authenticationUseCase) : super(const LoginState.idle()) {

  }
}
