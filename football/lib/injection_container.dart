import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:football/club/data/datasources/club_local_data_source.dart';
import 'package:football/club/data/datasources/club_remote_data_source.dart';
import 'package:football/club/data/repositories/club_repository_impl.dart';
import 'package:football/club/domain/repository/club_repository.dart';
import 'package:football/club/domain/usecases/get_clubs.dart';
import 'package:football/club/presentation/bloc/club/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/platform/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => ClubBloc(cubs: sl()),
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
