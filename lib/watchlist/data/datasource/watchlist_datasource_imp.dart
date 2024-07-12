import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_cinema/watchlist/data/datasource/watchlist_datasource.dart';
import 'package:my_cinema/watchlist/data/model/watchlist_item_model.dart';

class WatchListDatasourceImp implements WatchListDatasource{
  final Box _box = Hive.box('movies');
  @override
  Future<int> addWatchListItem(WatchListItemModel item) async{
    return await _box.add(item);
  }

  @override
  Future<List<WatchListItemModel>> getWatchListItems() async{
    return _box.values.map((e) => WatchListItemModel.fromEntity(e)).toList().reversed.toList();
  }

  @override
  Future<int> isItemAdded(int tmdbId) async{
    return _box.values.toList().indexWhere((e) => e.tmdbId == tmdbId);
  }

  @override
  Future<void> removeWatchListItem(int index) async{
      return _box.deleteAt(index);
  }

 
}