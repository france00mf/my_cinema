import 'package:my_cinema/search/data/model/search_result_item_model.dart';

abstract class SearchResultItemRepository{
  Future<List<SearchResultItemModel>> search(String search);
}