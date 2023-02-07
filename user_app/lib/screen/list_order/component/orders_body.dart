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

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _pullRefresh() async {
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
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          height: 90,
                          child: Align(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 260,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Start: ${order[index]['start_location_name']}',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const Spacer(),
                                        Text(
                                          'Destination: ${order[index]['addressName']}',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const Spacer(),
                                        Text(
                                          'Time Order: ${(order[index]['created'] as Timestamp).toDate()}',
                                          style: const TextStyle(color: Colors.red),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                  ),
                                  if (order[index]['status'] == 'In-progress')
                                    Column(
                                      children: [
                                        FadeTransition(
                                          opacity: _animationController,
                                          child: const Icon(
                                            Icons.local_shipping,
                                            color: Colors.red,
                                            size: 24.0,
                                            semanticLabel:
                                                'Text to announce in accessibility modes',
                                          ),
                                        ),
                                        Text(
                                          '${order[index]['status']}',
                                          style: const TextStyle(color: Colors.green),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    )
                                  else if (order[index]['status'] == 'Done')
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.check,
                                          color: Colors.blue,
                                          size: 24.0,
                                          semanticLabel: 'done',
                                        ),
                                        Text(
                                          '${order[index]['status']}',
                                          style: const TextStyle(color: Colors.green),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    )
                                  else if (order[index]['status'] == 'Create')
                                    const Flexible(
                                      child: Center(
                                        child: Text(
                                          'Waiting Find\nDriver',
                                          style: TextStyle(color: Colors.blue),
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    )
                                  else
                                    Center(
                                      child: Text(
                                        '${order[index]['status']}',
                                        style: const TextStyle(color: Colors.blue),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                ],
                              )),
                        ),
                      ),
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
