
import 'package:my_cinema/search/domain/entities/search_result_item_entity.dart';

class SearchResultItemModel extends SearchResultItemEntity{
  SearchResultItemModel({required super.tmdbID, required super.posterUrl, required super.title, required super.isMovie});


  factory SearchResultItemModel.fromJson(Map<String,dynamic> json)=> SearchResultItemModel(tmdbID: json[""], posterUrl: json[""], title: json[""], isMovie: json[""]);
  
}