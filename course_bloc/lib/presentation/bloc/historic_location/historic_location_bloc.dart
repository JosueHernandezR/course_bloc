import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'historic_location_event.dart';
part 'historic_location_state.dart';

class HistoricLocationBloc
    extends Bloc<HistoricLocationEvent, HistoricLocationState> {
  HistoricLocationBloc() : super(const HistoricLocationState()) {
    on<NewLocationEvent>(_onNewLocationHandler);
  }

  void addLocation(double lat, double lng) {
    add(NewLocationEvent((lat, lng)));
  }

  void onNewUserLocationCallback(double lat, double lng) {
    addLocation(lat, lng);
  }

  void _onNewLocationHandler(
    NewLocationEvent event,
    Emitter<HistoricLocationState> emit,
  ) {
    final newLocations = [...state.locations, event.location];
    emit(state.copyWith(locations: newLocations));
  }
}
