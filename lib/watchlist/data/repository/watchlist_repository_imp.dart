import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_cinema/core/data/error/failure.dart';
import 'package:my_cinema/core/domain/entities/media.dart';
import 'package:my_cinema/watchlist/data/datasource/watchlist_datasource.dart';
import 'package:my_cinema/watchlist/data/model/watchlist_item_model.dart';
import 'package:my_cinema/watchlist/domain/repository/watchlist_repository.dart';

class WatchListRepositoryImpl extends WatchlistRepository{
  final WatchListDatasource _baseWatchListDataSource;

  WatchListRepositoryImpl(this._baseWatchListDataSource);

  @override
  Future<Either<Failure, int>> addWatchListItem(Media media) async{
    try {
        int id = await _baseWatchListDataSource.addWatchListItem(
          WatchListItemModel.fromEntity(media)
        );
        return Right(id);
    } on HiveError catch (e) {
        return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, int>> checkIfItemAdded(int tmdbId) async{
    try {
        final result = await _baseWatchListDataSource.isItemAdded(
          tmdbId
        );
        return Right(result);
    } on HiveError catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Media>>> getWatchListItems() async {
    final result = (await _baseWatchListDataSource.getWatchListItems());
    try {
        return Right(result);
    } on HiveError catch (e) {  
        return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeWatchListItem(int index)async {
      try {
        await _baseWatchListDataSource.removeWatchListItem(index);
        return const Right(unit);
      } on HiveError catch (e) {
        return Left(DatabaseFailure(e.message));
      }
  }

}