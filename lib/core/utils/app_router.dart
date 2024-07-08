import 'package:booklyapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/Features/home/data/repos/home_repo_impl.dart';
import 'package:booklyapp/Features/home/presentaion/manger/similar_books_cubit/similar_box_cubit.dart';
import 'package:booklyapp/Features/home/presentaion/views/book_details_view.dart';
import 'package:booklyapp/Features/home/presentaion/views/home_view.dart';
import 'package:booklyapp/Features/search/presentaion/views/search_view.dart';
import 'package:booklyapp/Features/splash/presentaion/views/splash_view.dart';
import 'package:booklyapp/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
