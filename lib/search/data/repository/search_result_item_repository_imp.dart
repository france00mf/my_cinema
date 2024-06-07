import 'package:dartz/dartz.dart';
import 'package:my_cinema/core/data/error/failure.dart';
import 'package:my_cinema/search/data/model/search_result_item_model.dart';
import 'package:my_cinema/search/domain/repository/search_result_item_repository.dart';

class SearchResultItemImp implements SearchResultItemRepository {
  @override
  Future<Either<Failure, List<SearchResultItemModel>>> search(String search) {
    // TODO: implement search
    throw UnimplementedError();
  }

}