import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_cinema/core/data/error/exceptions.dart';
import 'package:my_cinema/core/data/error/failure.dart';
import 'package:my_cinema/core/domain/entities/media_details.dart';
import 'package:my_cinema/move/data/datasource/move_datasource.dart';
import 'package:my_cinema/move/domain/repository/movies_repository.dart';

import '../../../core/domain/entities/media.dart';

class MoviesRepositoryImpl extends MoviesRespository {
  final MoviesRemoteDataSource _baseMoviesRemoteDataSource;

  MoviesRepositoryImpl(this._baseMoviesRemoteDataSource);



  @override
  Future<Either<Failure, List<List<Media>>>> getMovies() async {
    try {
      final result = await _baseMoviesRemoteDataSource.getMovies();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioError catch (failure) {
      return Left(ServerFailure(failure.message!));
    }
  }

  @override
  Future<Either<Failure, MediaDetails>> getMovieDetails(int movieId) async{
       try {
      final result = await _baseMoviesRemoteDataSource.getMovieDetails(movieId);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioError catch (failure) {
      return Left(ServerFailure(failure.message!));
    }
  }

    @override
  Future<Either<Failure, List<Media>>> getAllPopularMovies(int page) async {
    try {
      final result =
          await _baseMoviesRemoteDataSource.getAllPopularMovies(page);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioError catch (failure) {
      return Left(ServerFailure(failure.message!));
    }
  }

    @override
  Future<Either<Failure, List<Media>>> getAllTopRatedMovies(int page) async {
    try {
      final result =
          await _baseMoviesRemoteDataSource.getAllTopRatedMovies(page);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    } on DioError catch (failure) {
      return Left(ServerFailure(failure.message!));
    }
  }

}
