
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_cinema/search/presenter/controller/search_bloc/search_event.dart';
import 'package:my_cinema/search/presenter/controller/search_bloc/search_state.dart';

class SearchBloc implements Bloc<SearchEvent, SearchState>{
  @override
  void add(SearchEvent event) {
    // TODO: implement add
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    // TODO: implement addError
  }

  @override
  Future<void> close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  void emit(SearchState state) {
    // TODO: implement emit
  }

  @override
  // TODO: implement isClosed
  bool get isClosed => throw UnimplementedError();

  @override
  void on<E extends SearchEvent>(EventHandler<E, SearchState> handler, {EventTransformer<E>? transformer}) {
    // TODO: implement on
  }

  @override
  void onChange(Change<SearchState> change) {
    // TODO: implement onChange
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(SearchEvent event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Transition<SearchEvent, SearchState> transition) {
    // TODO: implement onTransition
  }

  @override
  // TODO: implement state
  SearchState get state => throw UnimplementedError();

  @override
  // TODO: implement stream
  Stream<SearchState> get stream => throw UnimplementedError();


}