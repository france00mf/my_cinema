import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_cinema/core/domain/entities/media_details.dart';
import 'package:my_cinema/core/presentation/components/details_card.dart';
import 'package:my_cinema/core/presentation/components/error_screen.dart';
import 'package:my_cinema/core/presentation/components/loading_indicator.dart';
import 'package:my_cinema/core/presentation/utils/enums.dart';
import 'package:my_cinema/core/resources/app_values.dart';
import 'package:my_cinema/core/services/service_locator.dart';
import 'package:my_cinema/core/utils/functions.dart';
import 'package:my_cinema/move/presenter/controllers/movie_details_bloc/movie_details_bloc.dart';
import 'package:my_cinema/move/presenter/presenters/movie_card_details.dart';


class MovieDetailsView extends StatelessWidget {
  final int movieId;

  const MovieDetailsView({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<MovieDetailsBloc>()..add(GetMovieDetailsEvent(movieId)),
      child: Scaffold(
        body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return const LoadingIndicator();
              case RequestStatus.loaded:
                return MovieDetailsWidget(movieDetails: state.movieDetails!);
              case RequestStatus.error:
                return ErrorScreen(
                  onTryAgainPressed: () {
                    context
                        .read<MovieDetailsBloc>()
                        .add(GetMovieDetailsEvent(movieId));
                  },
                );
            }
          },
        ),
      ),
    );
  }
}

class MovieDetailsWidget extends StatelessWidget {
  const MovieDetailsWidget({
    required this.movieDetails,
    super.key,
  });

  final MediaDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailsCard(
            mediaDetails: movieDetails,
            detailsWidget: MovieCardDetails(movieDetails: movieDetails),
          ),
          getOverviewSection(movieDetails.overview),
          const SizedBox(height: AppSize.s8),
        ],
      ),
    );
  }
}
