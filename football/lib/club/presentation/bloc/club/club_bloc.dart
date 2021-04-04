import 'dart:async';

import 'package:bloc/bloc.dart';

import 'bloc.dart';

class ClubBloc extends Bloc<ClubEvent, ClubState> {
  ClubBloc() : super(Empty());

  @override
  Stream<ClubState> mapEventToState(ClubEvent event) async* {
    // TODO: Add your event logic
  }
}
