import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/texts.dart';
import '../../../core/error/exceptions.dart';
import '../models/club_model.dart';

abstract class ClubLocalDataSource {
  /// Gets the cached list of [ClubModel] which was gotten the last time.
  /// the user had an internet connection.
  ///
  /// Trows [CacheException] if no cached data is present.
  Future<List<ClubModel>> getLastData();

  Future<void> cacheClubs(List<ClubModel> clubsToCache);
}

class ClubLocalDataSourceImpl implements ClubLocalDataSource {
  final SharedPreferences sharedPreferences;

  ClubLocalDataSourceImpl({
    @required this.sharedPreferences,
  });

  @override
  Future<void> cacheClubs(List<ClubModel> clubsToCache) {
    return sharedPreferences.setString(
      CACHED_CLUBS,
      jsonEncode(clubsToCache),
    );
  }

  @override
  Future<List<ClubModel>> getLastData() {
    final jsonString = sharedPreferences.getString(CACHED_CLUBS);
    if (jsonString == null) {
      throw CacheException();
    }
    return Future.value(ClubModel.fromJsonList(jsonString));
  }
}
