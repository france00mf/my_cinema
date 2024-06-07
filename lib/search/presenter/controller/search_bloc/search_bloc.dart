
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_cinema/search/domain/use_case/search_result_item_use_case.dart';
import 'package:my_cinema/search/presenter/controller/search_bloc/search_event.dart';
import 'package:my_cinema/search/presenter/controller/search_bloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState>{
  SearchBloc(this.baseSearchUseCase):super(const SearchState()){
    on<GetSearchEvent>(_getSearchResults,transformer: deboundce(_duration));
  };

  final SearchResultItemUseCase baseSearchUseCase;

  Future<void> _getSearchResults()async{

  }
}