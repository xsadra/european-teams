import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/error/failure_extensions.dart';
import '../../../domain/entities/club.dart';
import '../../../domain/usecases/get_clubs.dart';
import 'bloc.dart';

class ClubBloc extends Bloc<ClubEvent, ClubState> {
  final GetClubs getClubs;
  bool ascOrder = true;
  List<Club> cachedClubs = [];

  ClubBloc({
    @required GetClubs clubs,
  })  : assert(clubs != null),
        getClubs = clubs,
        super(Empty());

  @override
  Stream<ClubState> mapEventToState(ClubEvent event) async* {
    if (event is GetClubsOnInit) {
      yield Loading();
      final failureOrClubs = await getClubs();
      yield failureOrClubs.fold(
        (failure) => Error(message: failure.toMessage),
        (clubs) {
          cachedClubs = clubs;
          clubs.sort((a, b) => a.name.compareTo(b.name));
          return Loaded(clubs: clubs);
        },
      );
    } else if (event is ResortClubs) {
      ascOrder = !ascOrder;
      if (ascOrder) {
        cachedClubs.sort((a, b) => a.name.compareTo(b.name));
      } else {
        cachedClubs.sort((a, b) => b.value.compareTo(a.value));
      }
      yield Loaded(clubs: cachedClubs);
      yield SortedBy(ascOrder: ascOrder);
    }
  }
}
