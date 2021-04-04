import 'package:dartz/dartz.dart';
import 'package:football/club/domain/entities/club.dart';
import 'package:football/club/domain/repository/club_repository.dart';
import 'package:football/core/error/failure.dart';

class GetClubs {
  final ClubRepository repository;

  GetClubs(this.repository);
  Future<Either<Failure, List<Club>>> call() async {
    return await repository.getClubs();
  }
}
