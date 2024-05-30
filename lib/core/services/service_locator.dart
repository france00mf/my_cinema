import 'package:get_it/get_it.dart';
import 'package:my_cinema/move/data/datasource/move_datasource.dart';
import 'package:my_cinema/move/data/datasource/move_datasource_imp.dart';
import 'package:my_cinema/move/data/repository/movies_repository_impl.dart';
import 'package:my_cinema/move/domain/repository/movies_repository.dart';
import 'package:my_cinema/move/domain/usecases/get_all_popular_movies_usecase.dart';
import 'package:my_cinema/move/domain/usecases/get_all_top_rated_movies_usecase.dart';
import 'package:my_cinema/move/domain/usecases/get_movie_details_usecase.dart';
import 'package:my_cinema/move/domain/usecases/get_movies_usecase.dart';
import 'package:my_cinema/move/presenter/controllers/movie_details_bloc/movie_details_bloc.dart';
import 'package:my_cinema/move/presenter/controllers/movies_bloc/movies_bloc.dart';
import 'package:my_cinema/move/presenter/controllers/popular_movies_bloc/popular_movies_bloc.dart';
import 'package:my_cinema/move/presenter/controllers/top_rated_movies_bloc/top_rated_movies_bloc.dart';


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
      sl.registerLazySingleton(() => GetMoviesDetailsUseCase(sl()));
      sl.registerLazySingleton(() => GetAllPopularMoviesUseCase(sl()));
      sl.registerLazySingleton(() => GetAllTopRatedMoviesUseCase(sl()));

        // Bloc
    sl.registerFactory(() => MoviesBloc(sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl()));
    sl.registerFactory(() => PopularMoviesBloc(sl()));
    sl.registerFactory(() => TopRatedMoviesBloc(sl()));

  }
}
