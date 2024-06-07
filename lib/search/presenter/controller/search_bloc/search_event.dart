import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable{
  
}

class GetSearchEvent extends SearchEvent{
  final String title;

  GetSearchEvent(this.title);
  
  @override
  // TODO: implement props
  List<Object?> get props => [
    title
  ];
}