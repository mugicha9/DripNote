import 'package:go_router/go_router.dart';

import '../../features/bean_management/presentation/bean_edit_page.dart';
import '../../features/common/presentation/splash_screen.dart';
import '../../features/recipe_list/presentation/recipe_edit_page.dart';
import '../../main.dart';
import '../presentation/settings_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashWrapper(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder:(context, state) => const MainScreen(),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: '/recipe/edit',
      name: 'recipeCreate',
      builder:(context, state) => const RecipeEditPage(),
    ),
    GoRoute(
      path: '/recipe/edit/:id',
      name: 'recipeEdit',
      builder: (_, state) {
        final id = state.pathParameters['id']!;
        return RecipeEditPage(recipeId: id);
      },
    ),
    GoRoute(
      path: '/bean_edit',
      name: 'beanCreate',
      builder: (context, state) => BeanEditPage(),
    ),
    GoRoute(
      path: '/bean_edit/:id',
      name: 'beanEdit',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return BeanEditPage(beanId: id);
      }
    ),
  ]
);