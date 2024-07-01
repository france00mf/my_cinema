import 'package:my_cinema/core/domain/entities/media.dart';

class WatchListItemModel extends Media{
    const WatchListItemModel({
    required super.tmdbID,
    required super.title,
    required super.releaseDate,
    required super.voteAverage,
    required super.posterUrl,
    required super.backdropUrl,
    required super.overview,
    required super.isMovie,
  });

  factory WatchListItemModel.fromEntity(Media media) {
    return WatchListItemModel(
      tmdbID: media.tmdbID,
      title: media.title,
      releaseDate: media.releaseDate,
      voteAverage: media.voteAverage,
      posterUrl: media.posterUrl,
      backdropUrl: media.backdropUrl,
      overview: media.overview,
      isMovie: media.isMovie,
    );
  }
}