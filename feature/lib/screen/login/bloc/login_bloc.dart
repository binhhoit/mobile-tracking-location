import 'package:data/usecases/auth/login_use_case.dart';
import 'package:data/usecases/location/firestore_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'login_state.dart';

@injectable
class LoginBloc extends Cubit<LoginState> {
  LoginUseCase loginUseCase;
  FirestoreUserCase firestoreUserCase;

  LoginBloc(this.loginUseCase, this.firestoreUserCase) : super(const LoginInit());

  Future<void> loginAction({required String email, required String pass}) async {
    emit(const LoginState.loading());
    try {
      await loginUseCase.execute(email: email, pass: pass);
      emit(const LoginState.validated());
    } catch (e) {
      emit(LoginState.error(e.toString()));
    }
  }

  test() async {
    var data = await firestoreUserCase.buildUseCaseStream("wOSYPFjGT2ZvAgm8ciDyM6eOntJ3");
    data.listen((event) {
      print(event?.data());
    });
  }
}
