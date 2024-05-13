import 'package:dio/dio.dart';
import 'package:my_cinema/move/data/datasource/move_datasource.dart';
import 'package:my_cinema/core/data/error/exceptions.dart';
import 'package:my_cinema/core/data/model/movie_model.dart';
import 'package:my_cinema/core/data/network/api_constants.dart';
import 'package:my_cinema/core/data/network/error_message_model.dart';

class MoviesRemoteDataSourceImpl extends MoviesRemoteDataSource {

  @override
  Future<List<List<MovieModel>>> getMovies() async {


    final response = Future.wait(
      [
        getNowPlayingMovies(),
      ],
      eagerError: true,
    );
    return response;
  }
  
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstants.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }


}