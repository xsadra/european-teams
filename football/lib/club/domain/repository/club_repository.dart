import 'package:dartz/dartz.dart';
import 'package:football/club/domain/entities/club.dart';
import 'package:football/core/error/failure.dart';

abstract class ClubRepository {
  Future<Either<Failure, List<Club>>> getClubs();
}
