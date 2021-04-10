import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/club.dart';
import '../repository/club_repository.dart';

class GetClubs {
  final ClubRepository repository;

  GetClubs(this.repository);

  Future<Either<Failure, List<Club>>> call() async {
    return await repository.getClubs();
  }
}
