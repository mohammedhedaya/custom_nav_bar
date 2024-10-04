import 'package:get_it/get_it.dart';

import '../cache/cache_helper.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  // getIt.registerFactory<AuthCubit>(() => AuthCubit());
  // getIt.registerFactory<HomeCubit>(() => HomeCubit());
  // getIt.registerLazySingleton(() => GlobalCubit());
}
