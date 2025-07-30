part of 'guests_bloc.dart';

enum GuestFilter { all, invited, noInvited }

class GuestsState extends Equatable {
  final List<Todo> guests;
  final GuestFilter filter;

  const GuestsState({this.guests = const [], this.filter = GuestFilter.all});

  int get howManyGuests => guests.length;
  int get howManyFilteredGuests => filteredGuests.length;

  List<Todo> get filteredGuests => switch (filter) {
    GuestFilter.all => guests,
    GuestFilter.invited => guests.where((guest) => guest.done).toList(),
    GuestFilter.noInvited => guests.where((guest) => !guest.done).toList(),
  };

  GuestsState copyWith({List<Todo>? guests, GuestFilter? filter}) =>
      GuestsState(guests: guests ?? this.guests, filter: filter ?? this.filter);

  @override
  List<Object?> get props => [guests, filter];
}
