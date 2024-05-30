import 'package:my_cinema/core/data/model/movie_model.dart';
import 'package:my_cinema/move/data/model/movie_details_model.dart';

abstract class MoviesRemoteDataSource {
  Future<List<List<MovieModel>>> getMovies();
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<MovieDetailsModel> getMovieDetails(int movieId);
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getAllPopularMovies(int page);
  Future<List<MovieModel>> getAllTopRatedMovies(int page);
  Future<List<MovieModel>> getTopRatedMovies();
}