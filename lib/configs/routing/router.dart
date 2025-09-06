import 'package:evencir_test/configs/routing/bottom_nav_tab.dart';
import 'package:evencir_test/configs/routing/routes.dart';
import 'package:evencir_test/feature/main_bottom_nav_screen.dart';
import 'package:evencir_test/feature/products/product_detail_screen.dart';
import 'package:evencir_test/feature/products/products_list_screen.dart';
import 'package:evencir_test/feature/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: Routes.splash.path,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: Routes.splash.path,
      builder: (context, state) => const SplashScreen(),
    ),

    GoRoute(
      path: Routes.main.path,
      builder: (context, state) {
        final tab = int.tryParse(state.pathParameters['tab'] ?? '');
        if (tab != null) {
          final initialTab = BottomNavTab.fromIndex(tab);
          return MainBottomNavigationScreen(initialTab: initialTab);
        }
        return const MainBottomNavigationScreen();
      },
    ),
    GoRoute(
      path: Routes.product.path,
      builder: (context, state) =>
          ProductDetailScreen(productId: state.pathParameters['id']!),
    ),
    GoRoute(
      path: Routes.products.path,
      builder: (context, state) =>
          ProductsListScreen(categoryUrl: state.extra as String),
    ),
  ],
);
