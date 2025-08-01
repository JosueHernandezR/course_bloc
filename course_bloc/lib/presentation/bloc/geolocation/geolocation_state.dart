part of 'geolocation_cubit.dart';

class GeolocationState extends Equatable {
  final (double latitude, double longitude) location;
  final bool isServiceEnabled;
  final bool isPermissionGranted;

  const GeolocationState({
    this.location = (0.0, 0.0),
    this.isServiceEnabled = false,
    this.isPermissionGranted = false,
  });

  GeolocationState copyWith({
    (double latitude, double longitude)? location,
    bool? isServiceEnabled,
    bool? isPermissionGranted,
  }) => GeolocationState(
    location: location ?? this.location,
    isServiceEnabled: isServiceEnabled ?? this.isServiceEnabled,
    isPermissionGranted: isPermissionGranted ?? this.isPermissionGranted,
  );

  @override
  List<Object?> get props => [location, isServiceEnabled, isPermissionGranted];
}
