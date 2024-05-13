import 'package:dartz/dartz.dart';
import 'package:my_cinema/core/data/error/failure.dart';

import '../../../core/domain/entities/media.dart';

abstract class MoviesRespository {
  Future<Either<Failure, List<List<Media>>>> getMovies();
}
