
import 'package:dartz/dartz.dart';
import 'package:my_cinema/core/data/error/failure.dart';
import 'package:my_cinema/core/domain/entities/media.dart';
import 'package:my_cinema/move/domain/repository/movies_repository.dart';

import '../../../core/domain/usecase/base_use_case.dart';

class GetMoviesUseCase extends BaseUseCase<List<List<Media>>, NoParameters> {
  final MoviesRespository _baseMoviesRespository;

  GetMoviesUseCase(this._baseMoviesRespository);

  @override
  Future<Either<Failure, List<List<Media>>>> call(NoParameters p) async {
    return await _baseMoviesRespository.getMovies();
  }
}
