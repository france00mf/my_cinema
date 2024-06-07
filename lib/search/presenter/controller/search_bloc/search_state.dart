import 'package:equatable/equatable.dart';
import 'package:my_cinema/search/domain/entities/search_result_item_entity.dart';


enum SearchRequestStatus{empty, loading, loaded, error,noResults}

class SearchState extends Equatable{
  final List<SearchResultItemEntity> searchResults;
  final SearchRequestStatus status;
  final String message;

  const SearchState(
    {
      this.searchResults = const[],
      this.status = SearchRequestStatus.empty,
      this.message = ''
    }
  );

  SearchState copyWith({
    List<SearchResultItemEntity>? searchResults,
    SearchRequestStatus? status,
    String? message
  }){
    return SearchState(
      message: message ?? this.message,
      searchResults: searchResults ?? this.searchResults ,
      status:  status ?? this.status
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [
        searchResults,
        status,
        message,
  ];
  
}