
import 'package:dartz/dartz.dart';
import 'package:my_cinema/core/data/error/failure.dart';
import 'package:my_cinema/core/domain/usecase/base_use_case.dart';
import 'package:my_cinema/search/domain/repository/search_result_item_repository.dart';

class SearchResultItemUseCase implements BaseUseCase{
  final SearchResultItemRepository baseSearchRepository;
  SearchResultItemUseCase(this.baseSearchRepository);
  
  @override
  Future<Either<Failure, dynamic>> call(p) {
    throw UnimplementedError();
  }

}