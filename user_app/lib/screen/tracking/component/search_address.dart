import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:logger/logger.dart';

class SearchAddress extends StatefulWidget {
  const SearchAddress({Key? key, required this.googlePlace, required this.onSearchLocation})
      : super(key: key);

  final GooglePlace googlePlace;
  final Function(LatLng, String) onSearchLocation;

  @override
  State<SearchAddress> createState() => _SearchAddressState();
}

class _SearchAddressState extends State<SearchAddress> {
  List<AutocompletePrediction> _predictions = [];
  Timer? _timer;
  final controlTextField = TextEditingController();

  void _autoCompleteSearch(String value) async {
    var result = await widget.googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && result.predictions!.isNotEmpty && mounted) {
      setState(() {
        _predictions = result.predictions!;
      });
    } else {
      Logger().e('Can not get this places! ${result?.status ?? ""}');
    }
  }

  Future<DetailsResult?> _getDetail(String placeId) async {
    final detail = await widget.googlePlace.details.get(placeId);
    return detail?.result;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    controlTextField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        controller: controlTextField,
        enableSuggestions: false,
        decoration: const InputDecoration(
            filled: true, fillColor: Colors.white, border: OutlineInputBorder(), labelText: ""),
        onChanged: (value) {
          _timer?.cancel();
          _timer = Timer(const Duration(seconds: 1), () {
            if (value.isNotEmpty) {
              _autoCompleteSearch(value);
            } else {
              if (_predictions.isNotEmpty && mounted) {
                setState(() {
                  _predictions = [];
                });
              }
            }
          });
        },
      ),
      const SizedBox(
        height: 4,
      ),
      Visibility(
        visible: _predictions.isNotEmpty,
        child: Container(
          height: (_predictions.length * 55) > 165 ? 165 : (_predictions.length * 55),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 4, left: 8, right: 8),
            itemCount: _predictions.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {
                  final placeId = _predictions[index].placeId;
                  if (placeId != null) {
                    final result = await _getDetail(placeId);
                    if (result != null) {
                      final location = LatLng(
                          result.geometry?.location?.lat ?? 0, result.geometry?.location?.lng ?? 0);
                      widget.onSearchLocation(location, _predictions[index].description ?? "");
                      controlTextField.text = _predictions[index].description ?? "";
                      setState(() {
                        _predictions.clear();
                      });
                    } else {
                      Logger().e('Can not get this detail!');
                    }
                  }
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _predictions[index].description ?? '',
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
          ),
        ),
      )
    ]);
  }
}
