import 'package:dripnote/features/recipe_list/domain/recipe.dart';
import 'package:dripnote/features/recipe_list/domain/recipe_process_step.dart';
import 'package:dripnote/features/recipe_list/domain/recipe_process_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/presentation/settings_page.dart';
import 'features/recipe_list/presentation/recipe_edit_page.dart';
import 'features/recipe_list/presentation/recipe_list_page.dart';
import 'features/bean_management/presentation/bean_management_page.dart';
import 'features/common/presentation/splash_screen.dart';
import 'features/recipe_list/data/recipe_repository_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(RecipeProcessTypeAdapter());
  Hive.registerAdapter(RecipeProcessStepAdapter());
  Hive.registerAdapter(RecipeAdapter());

  // Hive.deleteBoxFromDisk('recipes');

  final box = await Hive.openBox<Recipe>('recipes');

  runApp(ProviderScope(
    overrides: [
      recipeBoxProvider.overrideWithValue(box),
    ],
    child: DripNoteApp()
  ));
}

final GoRouter _router = GoRouter(
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
    )
  ]
);

class DripNoteApp extends StatelessWidget {
  const DripNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'DripNote',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      routerConfig: _router,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  static const List<Widget> _pages = [
    RecipeListPage(),
    BeanManagementPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap:(value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.coffee),
            label: 'Beans',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}