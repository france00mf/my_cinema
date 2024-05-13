import 'package:get_it/get_it.dart';
import 'package:my_cinema/move/data/datasource/move_datasource.dart';
import 'package:my_cinema/move/data/datasource/move_datasource_imp.dart';
import 'package:my_cinema/move/data/repository/movies_repository_impl.dart';
import 'package:my_cinema/move/domain/repository/movies_repository.dart';
import 'package:my_cinema/move/domain/usecases/get_movies_usecase.dart';
import 'package:my_cinema/move/presenter/controllers/movies_bloc/movies_bloc.dart';


final sl = GetIt.instance;

class ServiceLocator {
  static void init() {
        // Data source
    sl.registerLazySingleton<MoviesRemoteDataSource>(
        () => MoviesRemoteDataSourceImpl());
        
          // Repository
    sl.registerLazySingleton<MoviesRespository>(
        () => MoviesRepositoryImpl(sl()));

      // Use Cases
      sl.registerLazySingleton(() => GetMoviesUseCase(sl()));

        // Bloc
    sl.registerFactory(() => MoviesBloc(sl()));

  }
}
