import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.freezed.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.requestLogin() = RequestLogin;
  const factory LoginEvent.loginUsernameChange(String userName) = LoginUsernameChange;
  const factory LoginEvent.loginPasswordChange(String password) = LoginPasswordChange;
  const factory LoginEvent.authenticatedWithBiometric() = AuthenticatedWithBiometric;
}