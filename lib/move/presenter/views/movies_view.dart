import 'package:flutter/material.dart';
import 'package:my_cinema/core/domain/entities/media.dart';
import 'package:my_cinema/core/presentation/components/custom_slider.dart';
import 'package:my_cinema/core/presentation/components/slider_card.dart';


class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
      ),
    );
  }
}

class MoviesWidget extends StatelessWidget {
  final List<Media> nowPlayingMovies;
  final List<Media> popularMovies;
  final List<Media> topRatedMovies;

  const MoviesWidget({
    super.key,
    required this.nowPlayingMovies,
    required this.popularMovies,
    required this.topRatedMovies,
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

