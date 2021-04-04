import 'package:football/club/domain/entities/club.dart';

abstract class ClubRemoteDataSource {
  ///Calls the https://public.allaboutapps.at/hiring/clubs.json endpoint
  ///
  /// Throws [ServerException] for all error codes.
  Future<List<Club>> getClubs();
}
