import 'package:dartz/dartz.dart';
import 'package:my_cinema/core/data/error/failure.dart';
import 'package:my_cinema/core/domain/entities/media_details.dart';

import '../../../core/domain/entities/media.dart';

abstract class MoviesRespository {
  Future<Either<Failure, List<List<Media>>>> getMovies();
   Future<Either<Failure, MediaDetails>> getMovieDetails(int movieId);
}
