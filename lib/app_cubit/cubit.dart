import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constant.dart';
part 'state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);
  LatLng point = LatLng(49.5, -0.09);
  List<Location> location = [];
  final TextEditingController addressController = TextEditingController();
  late final MapController mapController = MapController();

  final TextEditingController latController = TextEditingController();
  final TextEditingController longController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Future<void> tapOnMap(LatLng p) async {
    emit(OnTapLoad());
    if (addressController.text.isNotEmpty) {
      location = await locationFromAddress(addressController.text);
    }
    point = p;
    latController.text = point.latitude.toString();
    longController.text = point.longitude.toString();
    location.add(Location(latitude: p.latitude, longitude: p.longitude, timestamp: DateTime.now()));
    mapController.move(p, 12.0);
    print(point);
    emit(OnTapSuccess());
  }

  Future<void> searchOnAddress(String address) async {
    emit(OnSearchLoad());
    location = await locationFromAddress(address);
    point = LatLng(location.first.latitude, location.first.longitude);
    latController.text = point.latitude.toString();
    longController.text = point.longitude.toString();
    mapController.move(point, 12.0);
    print(point);
    emit(OnSearchSuccess());
  }
  Gender? gender = Gender.Male;
  void changeGender(Gender? value){
    gender = value;
    emit(ChangeGenderState());
  }

  bool isChecked = false;
  void changeCheckbox(bool? value){
    isChecked = value!;
    emit(ChangeCheckboxState());
  }


}
