import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:football/club/data/datasources/club_local_data_source.dart';
import 'package:football/club/data/datasources/club_remote_data_source.dart';
import 'package:football/club/domain/entities/club.dart';
import 'package:football/club/domain/repository/club_repository.dart';
import 'package:football/core/error/exceptions.dart';
import 'package:football/core/error/failure.dart';
import 'package:football/core/platform/network_info.dart';

class ClubRepositoryImpl implements ClubRepository {
  final ClubLocalDataSource localDataSource;
  final ClubRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ClubRepositoryImpl({
    @required this.localDataSource,
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Club>>> getClubs() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteClubs = await remoteDataSource.getClubs();
        localDataSource.cacheClubs(remoteClubs);
        return right(remoteClubs);
      } on ServerException {
        return left(ServerFailure());
      }
    }
    try {
      final localTrivia = await localDataSource.getLastData();
      return Right(localTrivia);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
