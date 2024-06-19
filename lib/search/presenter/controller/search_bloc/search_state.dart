
part of 'search_bloc.dart';

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
  List<Object?> get props => [
        searchResults,
        status,
        message,
  ];
  
}