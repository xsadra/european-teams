import 'package:football/club/data/models/club_model.dart';

abstract class ClubLocalDataSource {
  /// Gets the cached list of [ClubModel] which was gotten the last time.
  /// the user had an internet connection.
  ///
  /// Trows [CacheException] if no cached data is present.
  Future<List<ClubModel>> getLastData();

  Future<void> cacheClubs(List<ClubModel> clubsToCache);
}
