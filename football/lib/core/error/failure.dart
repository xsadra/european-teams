import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  //Failure([List properties = const <dynamic>[]]) : super();
}

// General failures
class ServerFailure extends Failure {
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class CacheFailure extends Failure {
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
