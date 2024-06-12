
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_cinema/search/domain/use_case/search_result_item_use_case.dart';
import 'package:my_cinema/search/presenter/controller/search_bloc/search_event.dart';
import 'package:my_cinema/search/presenter/controller/search_bloc/search_state.dart';

const _duration = Duration(milliseconds: 400);

EventTransformer<Event> debounce<Event>(Duration duration){
  return (events,mapper) => events.debounce(duration).switchMap(mapper);
}
class SearchBloc extends Bloc<SearchEvent, SearchState>{
  SearchBloc(this.baseSearchUseCase):super(const SearchState()){
    on<GetSearchEvent>(_getSearchResults,transformer: debounce(_duration));
  }

  final SearchResultItemUseCase baseSearchUseCase;

  Future<void> _getSearchResults(
    GetSearchEvent event, Emitter<SearchState> emit
  )async{

    if(event.title.trim().isEmpty){
      return emit(
        state.copyWith(
          status: SearchRequestStatus.empty
        )
      );
    }

    emit(
      state.copyWith(
        status: SearchRequestStatus.loading,
      )
    );

    final result = await baseSearchUseCase(event.title);
    result.fold(
      (l) => emit(
        state.copyWith(
          status: SearchRequestStatus.error,
          message: l.message
        )
      ),
      (r){
        if(r.isEmpty){
          emit(state.copyWith(
            status: SearchRequestStatus.noResults
          ));
        }else{
          emit(
            state.copyWith(
              status: SearchRequestStatus.loaded,
              searchResults: r
            )
          );
        }
      }
    );

  }
}