import 'package:book_store/Core/blocObserver/bloc_0bserver.dart';
import 'package:book_store/Core/service_locator/service_locator.dart';
import 'package:book_store/Core/utils/Constants.dart';
import 'package:book_store/Core/utils/app_router.dart';
import 'package:book_store/Features/home/data/repository/home_repo_implementation.dart';
import 'package:book_store/Features/home/presentation/controller/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_store/Features/home/presentation/controller/newest_books_cubit/newest_books_cubit.dart';
import 'package:book_store/Features/home/presentation/controller/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setUpServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

    @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FeaturedBooksCubit(
                getIt.get<HomeRepoImplementation>())..fetchFeaturedBooks()),
        BlocProvider(
            create: (context) => NewestBooksCubit(
                getIt.get<HomeRepoImplementation>())..fetchNewestBooks()),
        BlocProvider(
            create: (context) => SearchCubit(
                getIt.get<HomeRepoImplementation>())),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Constants.scaffoldBackgroundColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}