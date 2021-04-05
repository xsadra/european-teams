import 'package:football/club/presentation/bloc/club/bloc.dart';

import 'failure.dart';

extension FailureExtension on Failure {
  String get toMessage {
    switch (this.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
