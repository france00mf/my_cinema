import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:my_cinema/core/presentation/pages/main_page.dart';

import 'package:my_cinema/core/resources/app_routes.dart';
import 'package:my_cinema/move/presenter/views/movie_details_view.dart';
import 'package:my_cinema/move/presenter/views/movies_view.dart';
import 'package:my_cinema/move/presenter/views/popular_movies_view.dart';

import '../../search/presenter/view/search_view.dart';

const String moviesPath = '/movies';
const String movieDetailsPath = 'movieDetails/:movieId';
const String popularMoviesPath = 'popularMovies';
const String topRatedMoviesPath = 'topRatedMovies';
const String tvShowsPath = '/tvShows';
const String tvShowDetailsPath = 'tvShowDetails/:tvShowId';
const String popularTVShowsPath = 'popularTVShows';
const String topRatedTVShowsPath = 'topRatedTVShows';
const String searchPath = '/search';
const String watchlistPath = '/watchlist';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: moviesPath,
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainPage(child: child),
        routes: [
          GoRoute(
            name: AppRoutes.moviesRoute,
            path: moviesPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: MoviesView(),
            ),
            routes: [
              GoRoute(
                path: movieDetailsPath,
                name: AppRoutes.movieDetailsRoute,
                pageBuilder: (context, state)=>  NoTransitionPage(child: 
                MovieDetailsView(movieId: int.parse(state.params['movieId']!)),
                )
                ),
                GoRoute(
                  path: popularMoviesPath,
                  name: AppRoutes.popularMoviesRoute,
                  pageBuilder: (context, state)=> const NoTransitionPage(child: 
                  PopularMoviesView())
                )
            ]
          ),
               GoRoute(
            name: AppRoutes.tvShowsRoute,
            path: tvShowsPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: CupertinoPageScaffold(child: Center()),
            ),
          ),

            GoRoute(
            name: AppRoutes.searchRoute,
            path: searchPath,
            pageBuilder: (context, state) =>  NoTransitionPage(
              child: SearchView(),
            ),
          ),

             GoRoute(
            name: AppRoutes.watchlistRoute,
            path: watchlistPath,
            pageBuilder: (context, state) => const NoTransitionPage(
               child: CupertinoPageScaffold(child: Center()),
            ),
          ),
       
        ],
      )
    ],
  );
}
