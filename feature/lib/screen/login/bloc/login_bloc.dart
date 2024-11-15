import 'package:data/usecases/auth/check_login_use_case.dart';
import 'package:data/usecases/auth/login_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'login_state.dart';

@injectable
class LoginBloc extends Cubit<LoginState> {
  LoginUseCase loginUseCase;
  CheckLoginUseCase checkLoginUseCase;

  LoginBloc(this.loginUseCase, this.checkLoginUseCase) : super(const LoginInit());

  Future<void> loginAction({required String email, required String pass}) async {
    emit(const LoginState.loading());
    try {
      await loginUseCase.execute(email: email, pass: pass);
      emit(const LoginState.validated());
    } catch (e) {
      emit(LoginState.error(e.toString()));
    }
  }

  Future<void> isAuthentication() async {
    try {
      var result = await checkLoginUseCase.execute();
      if (result) {
        emit(const LoginState.validated());
      }
    } catch (e) {
      emit(LoginState.error(e.toString()));
    }
  }
}
