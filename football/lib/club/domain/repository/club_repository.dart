import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/club.dart';

abstract class ClubRepository {
  Future<Either<Failure, List<Club>>> getClubs();
}
