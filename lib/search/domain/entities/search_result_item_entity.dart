import 'package:equatable/equatable.dart';

class SearchResultItemModel extends Equatable{
    final int tmdbID;
  final String posterUrl;
  final String title;
  final bool isMovie;

  const SearchResultItemModel({required this.tmdbID, required this.posterUrl, required this.title, required this.isMovie});
  @override
  List<Object?> get props => throw [
        tmdbID,
        posterUrl,
        title,
        isMovie,];

}