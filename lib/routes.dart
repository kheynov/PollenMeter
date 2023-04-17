import 'package:go_router/go_router.dart';
import 'package:pollen_meter/bottom_nav_bar_navigator/presentation/bottom_nav_bar_navigator.dart';
import 'package:pollen_meter/test/test_routes.dart';

class RouteGenerator {
  GoRouter get router => _goRouter;
  final GoRouter _goRouter = GoRouter(
    initialLocation: '/dashboard',
    routes: [
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const BottomNavBarNavigator(),
        routes: const [],
      ),
      GoRoute(
        path: '/record',
        builder: (context, state) => const MyHomePageTest2(),
        routes: const [],
      ),
      GoRoute(
        path: '/calendar',
        builder: (context, state) => const MyHomePageTest3(),
        routes: const [],
      ),
    ],
  );
}
