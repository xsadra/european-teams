import 'package:meta/meta.dart';

@immutable
abstract class ClubEvent {}

class GetClubsOnInit extends ClubEvent {}

class ResortClubs extends ClubEvent {}
