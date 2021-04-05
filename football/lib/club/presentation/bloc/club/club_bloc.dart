import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:football/club/domain/entities/club.dart';
import 'package:football/club/domain/usecases/get_clubs.dart';
import 'package:football/core/error/failure_extensions.dart';

import 'bloc.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class ClubBloc extends Bloc<ClubEvent, ClubState> {
  final GetClubs getClubs;
  bool ascOrder = true;
  List<Club> cachedClubs = [];
  ClubBloc({
    @required GetClubs cubs,
  })  : assert(cubs != null),
        getClubs = cubs,
        super(Empty());

  @override
  Stream<ClubState> mapEventToState(ClubEvent event) async* {
    if (event is GetClubsE) {
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
    }
  }
}
