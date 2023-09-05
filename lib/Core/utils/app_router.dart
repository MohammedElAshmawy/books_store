import 'package:book_store/Core/service_locator/service_locator.dart';
import 'package:book_store/Features/home/data/models/books_model.dart';
import 'package:book_store/Features/home/data/repository/home_repo_implementation.dart';
import 'package:book_store/Features/home/presentation/controller/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_store/Features/home/presentation/views/book_details_view.dart';
import 'package:book_store/Features/home/presentation/views/home_view.dart';
import 'package:book_store/Features/home/presentation/views/search_view.dart';
import 'package:book_store/Features/splash/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const homePath = '/HomeView';
  static const bookDetailsPath = '/BookDetailsView';
  static const searchPath = '/Search';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: searchPath,
        builder: (context, state) =>  const SearchView(),
      ),
      GoRoute(
        path: homePath,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: bookDetailsPath,
        builder: (context, state) => BlocProvider(
            create: (BuildContext context) => SimilarBooksCubit(getIt.get<HomeRepoImplementation>()),
            child: BookDetailsView(
              booksModel: state.extra as BooksModel,
            )),
      ),
    ],
  );
}
