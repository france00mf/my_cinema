import 'package:my_cinema/watchlist/data/model/watchlist_item_model.dart';


class WatchListDatasource{
    Future<List<WatchListItemModel>> getWatchListItems();
  Future<int> addWatchListItem(WatchListItemModel item);
  Future<void> removeWatchListItem(int index);
  Future<int> isItemAdded(int tmdbId);
}