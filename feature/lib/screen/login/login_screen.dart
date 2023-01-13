import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/feature_injection.dart';
import 'bloc/login_bloc.dart';
import 'component/body_login.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key, required this.onSignInSuccess}) : super(key: key);

  Function(BuildContext context) onSignInSuccess;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        create: (context) => featureInjector.get(),
        child: BodyLogin(onSignInSuccess: onSignInSuccess),
      ),
    );
  }
}
