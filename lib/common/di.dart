import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../features/profile/students/data/network/student_network.dart';
import '../features/profile/students/data/repo/student_repo.dart';
import 'common_features/alert_handling/data/repo/alert_handling_repo.dart';
import 'common_features/loading/data/repo/loading_repo.dart';

/// Instance of Get It
final GetIt getIt = GetIt.instance;

class DependencyInjection {
  static final DependencyInjection _singleton = DependencyInjection._();

  factory DependencyInjection() => _singleton;

  DependencyInjection._();

  /// here we define all networks and repos for the bloc to have a singleton
  /// from each one to be used across all app
  Future<void> registerSingleton() async {
    getIt.registerLazySingleton(() => Dio());
    getIt.registerLazySingleton(() => Connectivity());

    /// register Networks:
    // getIt.registerLazySingleton(() => AuthNetwork(getIt()));
    getIt.registerLazySingleton(() => StudentNetwork(getIt()));
    // getIt.registerLazySingleton(() => WeeklyTimetableNetwork(getIt()));
    // getIt.registerLazySingleton(() => WeekdaysNetwork(getIt()));
    // getIt.registerLazySingleton(() => WeeklySessionsNetwork(getIt()));
    // getIt.registerLazySingleton(() => WeeklyTimetableDayNetwork(getIt()));
    // //--------------------------------------------------------------------------
    /// register Repositories:
    getIt.registerLazySingleton(() => LoadingRepository());
    getIt.registerLazySingleton(() => AlertHandlingRepository());
    // getIt
    //     .registerLazySingleton(() => AuthRepository(getIt(), getIt(), getIt()));
    getIt.registerLazySingleton(() => StudentRepository(getIt(), getIt()));
    // getIt.registerLazySingleton(
    //     () => WeeklyTimetableRepository(getIt(), getIt()));
    // getIt.registerLazySingleton(() => WeekdaysRepository(getIt(), getIt()));
    // getIt.registerLazySingleton(
    //     () => WeeklySessionsRepository(getIt(), getIt()));
    // getIt.registerLazySingleton(
    //     () => WeeklyTimetableDaysRepository(getIt(), getIt()));
    //--------------------------------------------------------------------------
  }
}
