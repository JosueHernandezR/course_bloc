import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'geolocation_state.dart';

class GeolocationCubit extends Cubit<GeolocationState> {
  GeolocationCubit() : super(const GeolocationState());

  Future<void> checkStatus() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permissionGranted = await Geolocator.checkPermission();
    if (permissionGranted == LocationPermission.denied) {
      permissionGranted = await Geolocator.requestPermission();
    }
    if (permissionGranted == LocationPermission.deniedForever) {
      emit(state.copyWith(isPermissionGranted: false));
    }
    emit(
      state.copyWith(
        isServiceEnabled: serviceEnabled,
        isPermissionGranted:
            permissionGranted == LocationPermission.always ||
            permissionGranted == LocationPermission.whileInUse,
      ),
    );
  }

  void watchUserLocation() async {
    await checkStatus();
    if (!state.isPermissionGranted || !state.isServiceEnabled) return;

    const locationSettings = LocationSettings(
      accuracy: LocationAccuracy.bestForNavigation,
      distanceFilter: 15,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings).listen((
      position,
    ) {
      // Aqui ya sabemos que el usuario tiene permisos y el servicio esta activo
      final newLocation = (position.latitude, position.longitude);
      if (newLocation != state.location) {
        emit(state.copyWith(location: newLocation));
      }
    });
  }
}
