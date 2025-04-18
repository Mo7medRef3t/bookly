import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_view.dart';
import 'package:bookly/features/search/presentation/views/search_view.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(routes: [
    GoRoute(path: kSearchView, builder: (context, state) => const SearchView()),
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
    GoRoute(
      path: kBookDetailsView,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const BookDetailsView(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    ),
  ]);
}
