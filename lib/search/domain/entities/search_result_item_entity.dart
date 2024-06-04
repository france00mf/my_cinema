import 'package:equatable/equatable.dart';

class SearchResultItemEntity extends Equatable{
    final int tmdbID;
  final String posterUrl;
  final String title;
  final bool isMovie;

  const SearchResultItemEntity({required this.tmdbID, required this.posterUrl, required this.title, required this.isMovie});
  @override
  List<Object?> get props => throw [
        tmdbID,
        posterUrl,
        title,
        isMovie,];

}