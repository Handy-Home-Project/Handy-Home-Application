import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:handy_home/data/data_sources/home_data_source.dart';
import 'package:handy_home/data/data_sources/user_data_source.dart';
import 'package:handy_home/data/repository_impls/home_repository_impl.dart';
import 'package:handy_home/data/repository_impls/shared_prefs_repository_impl.dart';
import 'package:handy_home/data/repository_impls/user_repository_impl.dart';
import 'package:handy_home/domain/repositories/home_repository.dart';
import 'package:handy_home/domain/repositories/shared_prefs_repository.dart';
import 'package:handy_home/domain/repositories/user_repository.dart';
import 'package:handy_home/domain/use_cases/home_use_case.dart';
import 'package:handy_home/domain/use_cases/user_use_case.dart';

class DependencyInjection {
  static GetIt getIt = GetIt.instance;

  static Future<void> configure() async {
    // Dio
    getIt.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: "http://handyhome.tplinkdns.com:8080")));

    // DataSource
    getIt.registerSingleton<UserDataSource>(UserDataSource(getIt.get()));
    getIt.registerSingleton<HomeDataSource>(HomeDataSource(getIt.get()));

    // Repository
    getIt.registerSingleton<SharedPreferencesRepository>(SharedPreferencesRepositoryImpl());
    getIt.registerSingleton<UserRepository>(UserRepositoryImpl(userDataSource: getIt.get()));
    getIt.registerSingleton<HomeRepository>(HomeRepositoryImpl(homeDataSource: getIt.get()));

    // UseCase
    getIt.registerSingleton<UserUseCase>(UserUseCase(sharedPreferencesRepository: getIt.get(), userRepository: getIt.get()));
    getIt.registerSingleton<HomeUseCase>(HomeUseCase(homeRepository: getIt.get()));
  }
}