import 'package:meta/meta.dart';

@immutable
abstract class ClubEvent {}

class GetClubs extends ClubEvent {}

class ResortClubs extends ClubEvent {}
