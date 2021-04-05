import 'package:meta/meta.dart';

@immutable
abstract class ClubEvent {}

class GetClubsE extends ClubEvent {}

class ResortClubs extends ClubEvent {}
