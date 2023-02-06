import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:user_app/screen/tracking/component/search_address.dart';

import '../bloc/create_order_bloc.dart';
import '../bloc/create_order_state.dart';

class CreateOrderBody extends StatefulWidget {
  CreateOrderBody({Key? key}) : super(key: key);

  @override
  State<CreateOrderBody> createState() => _CreateOrderBody();
}

class _CreateOrderBody extends State<CreateOrderBody> {
  CreateOrderBloc? _bloc;
  final Set<Marker> _markers = {};
  final GooglePlace _googlePlace = GooglePlace('AIzaSyAEGQ2Vmyz2OMQpOMSBSt5w8Wb7gJH8ip0');
  late GoogleMapController _mapController;
  final initLocation = const LatLng(
    0,
    0,
  );

  var destination = const LatLng(10.743553, 106.626414);
  var isEnableOne = false;
  var isEnableTwo = false;
  var isShowDistance = false;
  var isHideSearch = true;
  var isHideStartAddress = false;
  var addressNameSelected = "";

  var addressNameStart = "";
  var startLocation = const LatLng(10.743553, 106.626414);

  @override
  void initState() {
    // TODO: implement initState
    _bloc = context.read<CreateOrderBloc>();
    super.initState();
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _mapController = controller;
  }

  Future<void> _updateCameraToBounds(LatLng latLng) async {
    Future.delayed(const Duration(milliseconds: 500), () async {
      await _mapController.animateCamera(
          CameraUpdate.newCameraPosition(CameraPosition(target: latLng, zoom: 15.5)));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateOrderBloc, CreateOrderState>(builder: (context, state) {
      return Stack(
        children: [
          GoogleMap(
              myLocationButtonEnabled: false,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: initLocation,
                zoom: 13.5,
              ),
              markers: _markers),
          Visibility(
            visible: isHideSearch,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white54, borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("What address do you want to deliver to?"),
                        const SizedBox(height: 20),
                        SearchAddress(
                            googlePlace: _googlePlace,
                            onSearchLocation: (location, addressName) {
                              _updateCameraToBounds(location);
                              setState(() {
                                isEnableOne = true;
                              });
                              destination = location;
                              addressNameSelected = addressName;
                            }),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 45,
                          width: double.infinity,
                          child: MaterialButton(
                            color: isEnableOne ? Colors.black : Colors.grey,
                            height: 50,
                            onPressed: () {
                              setState(() {
                                isHideSearch = false;
                                isHideStartAddress = true;
                              });
                            },
                            child: const Text(
                              "Next",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: isHideStartAddress,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white54, borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("What is the delivery address?"),
                        const SizedBox(height: 20),
                        SearchAddress(
                            googlePlace: _googlePlace,
                            onSearchLocation: (location, addressName) {
                              _updateCameraToBounds(location);
                              setState(() {
                                isEnableTwo = true;
                                isShowDistance = true;
                              });
                              startLocation = location;
                              addressNameStart = addressName;
                            }),
                        const SizedBox(height: 15),
                        Visibility(visible: isShowDistance, child: Text("Distance ${2}km")),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 45,
                          width: double.infinity,
                          child: MaterialButton(
                            color: isEnableTwo ? Colors.black : Colors.grey,
                            height: 50,
                            onPressed: () {
                              _bloc?.updateStatusTrackingMap(destination, addressNameSelected,
                                  startLocation, addressNameStart);
                              setState(() {
                                isHideStartAddress = false;
                              });
                            },
                            child: const Text(
                              "Confirm",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      );
    }, listener: (context, state) async {
      if (state is SuccessUploadOrder) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Created order successful."),
        ));
      }
    });
  }
}
