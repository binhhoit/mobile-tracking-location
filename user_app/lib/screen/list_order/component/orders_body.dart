import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../tracking/map_screen.dart';
import '../bloc/orders_bloc.dart';
import '../bloc/orders_state.dart';

class OrdersBody extends StatefulWidget {
  OrdersBody({Key? key}) : super(key: key);

  @override
  State<OrdersBody> createState() => _OrdersBody();
}

class _OrdersBody extends State<OrdersBody> with SingleTickerProviderStateMixin {
  OrdersBloc? _bloc;
  List<Map> order = [];
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    _bloc = context.read<OrdersBloc>();
    _bloc?.getListOrder();
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.repeat(reverse: true);
    super.initState();
  }

  Future<void> _pullRefresh() async {
    await _bloc?.getListOrder();
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      order;
    });
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
          RefreshIndicator(
              onRefresh: _pullRefresh,
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 4, left: 8, right: 8),
                itemCount: order.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      var geo = order[index]['destination'] as GeoPoint;
                      var idDriver = order[index]['driver_id'];
                      var destination = LatLng(geo.latitude, geo.longitude);
                      var idOrderDocument = order[index]['id'];
                      if (idDriver != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) => TrackingScreen(
                                    destination: destination,
                                    location: const LatLng(10.724058, 106.628605),
                                    idDriver: idDriver,
                                    idOderDocument: idOrderDocument,
                                  )),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Driver not share location"),
                        ));
                      }
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Align(
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 300,
                                        child: Text(
                                          (order[index]['addressName']).toString(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        (order[index]['created'] as Timestamp).toDate().toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  if (order[index]['status'] == 'In-progress')
                                    FadeTransition(
                                      opacity: _animationController,
                                      child: const Icon(
                                        Icons.local_shipping,
                                        color: Colors.red,
                                        size: 24.0,
                                        semanticLabel: 'Text to announce in accessibility modes',
                                      ),
                                    )
                                  else if (order[index]['status'] == 'Done')
                                    const Icon(
                                      Icons.check,
                                      color: Colors.blue,
                                      size: 24.0,
                                      semanticLabel: 'done',
                                    )
                                ],
                              )),
                        ),
                        const Divider()
                      ],
                    ),
                  );
                },
              ))
        ],
      );
    }, listener: (context, state) async {
      if (state is OrdersData) {
        order = state.orders;
      }
    });
  }
}
