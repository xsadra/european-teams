import 'package:meta/meta.dart';

import '../../../domain/entities/club.dart';

@immutable
abstract class ClubState {}

class Empty extends ClubState {}

class Loading extends ClubState {}

class Loaded extends ClubState {
  final List<Club> clubs;

  Loaded({
    @required this.clubs,
  });
}

class SortedBy extends ClubState {
  final bool ascOrder;

  SortedBy({
    @required this.ascOrder,
  });
}

class Error extends ClubState {
  final String message;

  Error({
    @required this.message,
  });
}
