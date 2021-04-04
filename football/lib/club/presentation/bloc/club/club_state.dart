import 'package:football/club/domain/entities/club.dart';
import 'package:meta/meta.dart';

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

class Error extends ClubState {
  final String message;

  Error({
    @required this.message,
  });
}
