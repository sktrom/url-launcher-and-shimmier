import 'package:go_router/go_router.dart';
import 'package:url_lanch_and_shimmer_app/home_page.dart';
import 'package:url_lanch_and_shimmer_app/shimmer/shimmer.dart';

abstract class AppRouter {
  static const khomePage = '/';
  static const kshimmerView = '/shimmerView';
  static final route = GoRouter(
    routes: [
      GoRoute(
        path: khomePage,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: kshimmerView,
        builder: (context, state) => const ShimmerView(),
      ),
    ],
  );
}
