import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../user_injection.dart';
import 'bloc/create_order_bloc.dart';
import 'component/create_order_body.dart';

class CreateOrderScreen extends StatelessWidget {
  const CreateOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Order"),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        /* actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout_outlined),
          )
        ],*/
      ),
      body: BlocProvider<CreateOrderBloc>(
        create: (context) => injector.get(),
        child: CreateOrderBody(),
      ),
    );
  }
}
