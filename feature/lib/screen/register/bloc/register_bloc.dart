import 'package:data/usecases/auth/register_use_case.dart';
import 'package:feature/screen/register/bloc/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterBloc extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;

  RegisterBloc(this.registerUseCase) : super(const RegisterInit());

  Future<void> registerAccount(
      {required String email, required String pass, required String passConfirm}) async {
    emit(const RegisterState.loading());
    if (pass != passConfirm) {
      emit(const RegisterState.error("Password does not match"));
    } else {
      try {
        await registerUseCase.execute(email: email, pass: pass);
        emit(const RegisterState.validated());
      } catch (e) {
        emit(RegisterState.error(e.toString()));
      }
    }
  }
}
