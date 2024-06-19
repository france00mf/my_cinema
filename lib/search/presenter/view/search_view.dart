
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_cinema/core/presentation/components/error_text.dart';
import 'package:my_cinema/core/presentation/components/loading_indicator.dart';
import 'package:my_cinema/core/resources/app_values.dart';
import 'package:my_cinema/search/presenter/controller/search_bloc/search_bloc.dart';
import 'package:my_cinema/search/presenter/controller/search_bloc/search_state.dart';
import 'package:my_cinema/search/presenter/view/components/no_results.dart';
import 'package:my_cinema/search/presenter/view/components/search_field.dart';
import 'package:my_cinema/search/presenter/view/components/search_grid_view.dart';
import 'package:my_cinema/search/presenter/view/components/search_text.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  
  @override
  void initState() {
    super.initState();  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
             top: AppPadding.p12,
            left: AppPadding.p16,
            right: AppPadding.p16,
        ),
        child: Column(
          children: [
            SearchField(),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                switch(state.status){
                  case SearchRequestStatus.empty:
                   return const SearchText();
                  case SearchRequestStatus.loading:
                    return const Expanded(child: LoadingIndicator());
                  case SearchRequestStatus.loaded:
                    return SearchGridView(results: state.searchResults);
                  case SearchRequestStatus.error:
                    return const Expanded(child: ErrorText());
                  case SearchRequestStatus.noResults:
                    return const NoResults();
                };
              },
            )
          ],
        ),
      ), 
    );
  }
}

