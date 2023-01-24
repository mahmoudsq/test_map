import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';

import '../app_cubit/cubit.dart';
class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
     listener: (context, state) {},
      builder: (context, state) {
      var cubit = AppCubit.get(context);
      return Stack(
      children: [
        FlutterMap(
          mapController: cubit.mapController,
          options: MapOptions(
            enableScrollWheel: true,
            scrollWheelVelocity: 0.005,
            center: cubit.point,
            zoom: 5.0,
            onTap: (tapPosition, point) async => await cubit.tapOnMap(point),
          ),
          children: [
            TileLayer(
              urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              retinaMode: MediaQuery.of(context).devicePixelRatio > 1.0,
              subdomains: const ['a', 'b', 'c'],
              //reset: resetController.stream,
            ),
            MarkerLayer(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: cubit.point,
                  builder: (ctx) => const Icon(
                    Icons.location_on,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 34.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                child: TextField(
                  controller: cubit.addressController,
                  onSubmitted: (value) async => await cubit.searchOnAddress(value) ,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(16.0),
                    hintText: "Search for your location",
                    prefixIcon: Icon(Icons.location_on_outlined),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(cubit.location.isEmpty ? '' :
                      "${cubit.location.first.latitude},${cubit.location.first.longitude},"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  },
);
  }
}
