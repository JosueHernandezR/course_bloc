import 'package:bloc/bloc.dart';
import 'package:course_bloc/config/helpers/random_generator.dart';
import 'package:course_bloc/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

part 'guests_event.dart';
part 'guests_state.dart';

const uuid = Uuid();

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc()
    : super(
        GuestsState(
          guests: [
            Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null,
            ),
            Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null,
            ),
            Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null,
            ),
            Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now(),
            ),
            Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now(),
            ),
            Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now(),
            ),
            Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now(),
            ),
            Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null,
            ),
            Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null,
            ),
            Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null,
            ),
          ],
        ),
      ) {
    // on<SetAllFilterEvent>((event, emit) {
    //   emit(state.copyWith(filter: GuestFilter.all));
    // });
    // on<SetInvitedFilterEvent>((event, emit) {
    //   emit(state.copyWith(filter: GuestFilter.invited));
    // });
    // on<SetNoInvitedFilterEvent>((event, emit) {
    //   emit(state.copyWith(filter: GuestFilter.noInvited));
    // });
    // on<SetCustomFilterEvent>((event, emit) {
    //   emit(state.copyWith(filter: event.newFilter));
    // });
    on<SetCustomFilterEvent>((event, emit) {
      emit(state.copyWith(filter: event.newFilter));
    });
    on<AddGuestEvent>(_handleAddGuest);
    on<ToggleGuestEvent>(_toggleGuestHandler);
  }

  void changeFilter(GuestFilter newFilter) {
    add(SetCustomFilterEvent(newFilter));
  }

  void addGuest(String name) {
    add(AddGuestEvent(name));
  }

  void toggleGuest(String id) {
    add(ToggleGuestEvent(id));
  }

  void _handleAddGuest(AddGuestEvent event, Emitter<GuestsState> emit) {
    final newGuest = Todo(
      id: uuid.v4(),
      description: event.name,
      completedAt: null,
    );
    emit(state.copyWith(guests: [...state.guests, newGuest]));
  }

  void _toggleGuestHandler(ToggleGuestEvent event, Emitter<GuestsState> emit) {
    final newGuests = state.guests
        .map(
          (g) => g.id == event.id
              ? g.copyWith(
                  completedAt: g.completedAt == null ? DateTime.now() : null,
                )
              : g,
        )
        .toList();
    emit(state.copyWith(guests: newGuests));
  }
}
