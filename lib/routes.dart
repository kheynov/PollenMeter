import 'package:go_router/go_router.dart';
import 'package:pollen_meter/bottom_nav_bar_navigator/presentation/bottom_nav_bar_navigator.dart';
import 'package:pollen_meter/pollen_statistics/widgets/statistics_page.dart';
import 'package:pollen_meter/profile/presentation/widgets/profile_page.dart';

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
        path: '/profile',
        builder: (context, state) => const ProfilePage(),
        routes: const [],
      ),
      GoRoute(
        path: '/statistics',
        builder: (context, state) => const StatisticsPage(),
        routes: const [],
      ),
    ],
  );
}
