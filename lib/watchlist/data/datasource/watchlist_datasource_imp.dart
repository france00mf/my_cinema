import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_cinema/watchlist/data/datasource/watchlist_datasource.dart';
import 'package:my_cinema/watchlist/data/model/watchlist_item_model.dart';

class WatchListDatasourceImp implements WatchListDatasource{
  final Box _box = Hive.box('movies');
  @override
  Future<int> addWatchListItem(WatchListItemModel item) {
    // TODO: implement addWatchListItem
    throw UnimplementedError();
  }

  @override
  Future<List<WatchListItemModel>> getWatchListItems() {
    // TODO: implement getWatchListItems
    throw UnimplementedError();
  }

  @override
  Future<int> isItemAdded(int tmdbId) {
    // TODO: implement isItemAdded
    throw UnimplementedError();
  }

  @override
  Future<void> removeWatchListItem(int index) {
    // TODO: implement removeWatchListItem
    throw UnimplementedError();
  }
 
}