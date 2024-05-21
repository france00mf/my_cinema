import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_cinema/core/domain/entities/media.dart';
import 'package:my_cinema/core/presentation/components/custom_slider.dart';
import 'package:my_cinema/core/presentation/components/error_screen.dart';
import 'package:my_cinema/core/presentation/components/loading_indicator.dart';
import 'package:my_cinema/core/presentation/components/section_header.dart';
import 'package:my_cinema/core/presentation/components/section_listview.dart';
import 'package:my_cinema/core/presentation/components/section_listview_card.dart';
import 'package:my_cinema/core/presentation/components/slider_card.dart';
import 'package:my_cinema/core/presentation/utils/enums.dart';
import 'package:my_cinema/core/resources/app_routes.dart';
import 'package:my_cinema/core/resources/app_strings.dart';
import 'package:my_cinema/core/resources/app_values.dart';
import 'package:my_cinema/move/presenter/controllers/movies_bloc/movies_bloc.dart';
import 'package:my_cinema/move/presenter/controllers/movies_bloc/movies_event.dart';

import '../../../core/services/service_locator.dart';
import '../controllers/movies_bloc/movies_state.dart';


class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()..add(GetMoviesEvent()), 
      child: Scaffold(
        
         body: BlocBuilder<MoviesBloc, MoviesState>(
           builder: (context, state) {
             switch (state.status) {
                case RequestStatus.loading:
                  return const LoadingIndicator();
                case RequestStatus.loaded:
                  return MoviesWidget(
                    nowPlayingMovies: state.movies[0],
                    popularMovies: state.movies[1],
                  );
                case RequestStatus.error:
                  return   ErrorScreen(
                    onTryAgainPressed: () {
                      context.read<MoviesBloc>().add(GetMoviesEvent());
                    },
                  );
              }
           }
        ),
      ),
    );
  }
}

class MoviesWidget extends StatelessWidget {
  final List<Media> nowPlayingMovies;
  final List<Media> popularMovies;

  const MoviesWidget({
    super.key,
    required this.nowPlayingMovies,
    required this.popularMovies,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSlider(
            itemBuilder: (context, itemIndex, _) {
              return SliderCard(
                media: nowPlayingMovies[itemIndex],
                itemIndex: itemIndex,
              );
            },
          ),
          SectionHeader(
            title: AppStrings.popularMovies,
            onSeeAllTap: () {
              context.goNamed(AppRoutes.popularMoviesRoute);
            },
          ),
           SectionListView(
            height: AppSize.s240,
            itemCount: popularMovies.length,
            itemBuilder: (context, index) {
              return SectionListViewCard(media: popularMovies[index]);
            },
          ),
        ],
      ),
    );
  }
}

