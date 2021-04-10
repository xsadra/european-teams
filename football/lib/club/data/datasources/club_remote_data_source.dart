import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/constants/texts.dart';
import '../../../core/error/exceptions.dart';
import '../../domain/entities/club.dart';
import '../models/club_model.dart';

abstract class ClubRemoteDataSource {
  ///Calls the https://public.allaboutapps.at/hiring/clubs.json endpoint
  ///
  /// Throws [ServerException] for all error codes.
  Future<List<Club>> getClubs();
}

class ClubRemoteDataSourceImpl implements ClubRemoteDataSource {
  final Dio dio;

  ClubRemoteDataSourceImpl({
    @required this.dio,
  });

  Future<List<Club>> getClubs() async {
    Response response = await dio
        .get(API_URL, queryParameters: {
          'headers': {'Content-Type': 'application/json'}
        })
        .timeout(Duration(seconds: 30))
        .catchError((onError) {
          throw ServerException();
        });
    return (response.data as List)
        .map((item) => ClubModel.fromJson(item))
        .toList();
  }
}
