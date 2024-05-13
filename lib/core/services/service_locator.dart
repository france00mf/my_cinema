import 'package:get_it/get_it.dart';


final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
      
      // Use Cases
      sl.registerLazySingleton(() => GetMoviesUseCase(sl()));

  }
}
