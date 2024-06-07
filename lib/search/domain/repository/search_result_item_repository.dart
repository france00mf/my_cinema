import 'package:dartz/dartz.dart';
import 'package:my_cinema/core/data/error/failure.dart';
import 'package:my_cinema/search/data/model/search_result_item_model.dart';

abstract class SearchResultItemRepository{
  Future<Either<Failure, List<SearchResultItemModel>>> search(String search);
}