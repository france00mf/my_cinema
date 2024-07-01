
abstract class WatchlistRepository{
  Future<Either<Failure, List<Media>> getWatchListItems();
}