import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'club/data/datasources/datasources.dart';
import 'club/data/repositories/club_repository_impl.dart';
import 'club/domain/repository/club_repository.dart';
import 'club/domain/usecases/get_clubs.dart';
import 'club/presentation/bloc/club/bloc.dart';
import 'core/platform/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => ClubBloc(clubs: sl()),
  );

  sl.registerLazySingleton(() => GetClubs(sl()));

  sl.registerLazySingleton<ClubRepository>(
    () => ClubRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<ClubLocalDataSource>(
    () => ClubLocalDataSourceImpl(sharedPreferences: sl()),
  );
  sl.registerLazySingleton<ClubRemoteDataSource>(
    () => ClubRemoteDataSourceImpl(dio: sl()),
  );

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton(() => DataConnectionChecker());

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
