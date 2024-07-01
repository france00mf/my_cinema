import 'package:my_cinema/watchlist/data/model/watchlist_item_model.dart';

abstract class WatchListDatasourceImp{
  Future<List<WatchListItemModel>> getWatchListItems();
}