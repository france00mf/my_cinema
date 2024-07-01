import 'package:my_cinema/watchlist/data/model/watchlist_item_model.dart';

abstract class WatchListDatasourceImp{
  Future<List<WatchListItemModel>> getWatchListItems();
  Future<int> addWatchListItem(WatchListItemModel item);
  Future<void> removeWatchListItem(int index);
  Future<int> isItemAdded(int tmdbId);
}