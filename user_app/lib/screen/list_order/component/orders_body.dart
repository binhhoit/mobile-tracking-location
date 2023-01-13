import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../tracking/map_screen.dart';
import '../bloc/orders_bloc.dart';
import '../bloc/orders_state.dart';

class OrdersBody extends StatefulWidget {
  OrdersBody({Key? key}) : super(key: key);

  @override
  State<OrdersBody> createState() => _OrdersBody();
}

class _OrdersBody extends State<OrdersBody> {
  OrdersBloc? _bloc;
  List<Map> order = [];

  @override
  void initState() {
    // TODO: implement initState
    _bloc = context.read<OrdersBloc>();
    _bloc?.getListOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersBloc, OrdersState>(builder: (context, state) {
      return Stack(
        children: [
          Visibility(
            visible: order.isEmpty,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.only(top: 4, left: 8, right: 8),
            itemCount: order.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(builder: (BuildContext context) => TrackingScreen()),
                  );
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          (order[index]['created'] as Timestamp).toDate().toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const Divider()
                  ],
                ),
              );
            },
          )
        ],
      );
    }, listener: (context, state) async {
      if (state is OrdersData) {
        order = state.orders;
      }
    });
  }
}
