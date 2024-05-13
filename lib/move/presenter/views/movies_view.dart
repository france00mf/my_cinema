import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_cinema/core/domain/entities/media.dart';
import 'package:my_cinema/core/presentation/components/custom_slider.dart';
import 'package:my_cinema/core/presentation/components/error_screen.dart';
import 'package:my_cinema/core/presentation/components/loading_indicator.dart';
import 'package:my_cinema/core/presentation/components/slider_card.dart';
import 'package:my_cinema/core/presentation/utils/enums.dart';
import 'package:my_cinema/move/presenter/controllers/movies_bloc/movies_bloc.dart';
import 'package:my_cinema/move/presenter/controllers/movies_bloc/movies_event.dart';

import '../controllers/movies_bloc/movies_state.dart';


class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
       body: BlocBuilder<MoviesBloc, MoviesState>(
         builder: (context, state) {
           switch (state.status) {
              case RequestStatus.loading:
                return const LoadingIndicator();
              case RequestStatus.loaded:
                return MoviesWidget(
                  nowPlayingMovies: state.movies[0],
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
    );
  }
}

class MoviesWidget extends StatelessWidget {
  final List<Media> nowPlayingMovies;

  const MoviesWidget({
    super.key,
    required this.nowPlayingMovies,
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
        ],
      ),
    );
  }
}

