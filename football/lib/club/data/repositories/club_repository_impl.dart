import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../../core/platform/network_info.dart';
import '../../domain/entities/club.dart';
import '../../domain/repository/club_repository.dart';
import '../datasources/datasources.dart';

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
