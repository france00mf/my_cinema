
import 'package:my_cinema/core/utils/functions.dart';
import 'package:my_cinema/search/domain/entities/search_result_item_entity.dart';

class SearchResultItemModel extends SearchResultItemEntity{
  SearchResultItemModel({required super.tmdbID, required super.posterUrl, required super.title, required super.isMovie});


  factory SearchResultItemModel.fromJson(Map<String,dynamic> json)=> SearchResultItemModel(
     tmdbID: json['id'],
      posterUrl: getPosterUrl(json['poster_path']),
      title: json['title'] ?? json['name'],
      isMovie: json['media_type'] == 'movie',
  );
  
}