import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/register_bloc.dart';
import '../bloc/register_state.dart';

class BodyRegister extends StatefulWidget {
  BodyRegister({Key? key}) : super(key: key);

  @override
  State<BodyRegister> createState() => _BodyRegister();
}

class _BodyRegister extends State<BodyRegister> {
  RegisterBloc? _bloc;
  final userName = TextEditingController();
  final password = TextEditingController();
  final passwordConfirm = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _bloc = context.read<RegisterBloc>();
    super.initState();
  }

  @override
  void dispose() {
    userName.dispose();
    password.dispose();
    passwordConfirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Stack(
            children: [
              Column(children: [
                const Spacer(
                  flex: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: userName,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                      hintText: 'Enter Your Name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: passwordConfirm,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password Confirm',
                      hintText: 'Enter Password Confirm',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                if (state is RegisterError)
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: MaterialButton(
                    color: Colors.white,
                    height: 50,
                    onPressed: () {
                      _bloc?.registerAccount(
                          email: userName.text,
                          pass: password.text,
                          passConfirm: passwordConfirm.text);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    )),
                const Spacer(
                  flex: 1,
                ),
              ]),
              if (state is RegisterLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          );
        },
        listener: (context, state) {});
  }
}
