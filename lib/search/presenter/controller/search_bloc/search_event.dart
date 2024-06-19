part of 'search_bloc.dart';
abstract class SearchEvent extends Equatable{
  const SearchEvent();
}

class GetSearchEvent extends SearchEvent{
  final String title;

  const GetSearchEvent(this.title);
  
  @override
  List<Object?> get props => [
    title
  ];
}