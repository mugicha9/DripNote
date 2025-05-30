import 'package:dripnote/features/bean_management/data/bean_repository_impl.dart';
import 'package:dripnote/features/bean_management/presentation/bean_edit_page.dart';
import 'package:dripnote/features/recipe_list/domain/recipe.dart';
import 'package:dripnote/features/recipe_list/domain/recipe_process_step.dart';
import 'package:dripnote/features/recipe_list/domain/recipe_process_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/presentation/settings_page.dart';
import 'features/bean_management/domain/bean.dart';
import 'features/recipe_list/presentation/recipe_edit_page.dart';
import 'features/recipe_list/presentation/recipe_list_page.dart';
import 'features/bean_management/presentation/bean_management_page.dart';
import 'features/common/presentation/splash_screen.dart';
import 'features/recipe_list/data/recipe_repository_impl.dart';
import 'core/routes/routers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(RecipeProcessTypeAdapter());
  Hive.registerAdapter(RecipeProcessStepAdapter());
  Hive.registerAdapter(RecipeAdapter());

  Hive.registerAdapter(BeanAdapter());

  // Hive.deleteBoxFromDisk('recipes');

  final boxRecipe = await Hive.openBox<Recipe>('recipes');
  final boxBean = await Hive.openBox<Bean>('beans');

  runApp(ProviderScope(
    overrides: [
      recipeBoxProvider.overrideWithValue(boxRecipe),
      beanBoxProvider.overrideWithValue(boxBean)
    ],
    child: DripNoteApp()
  ));
}

final mainScreenIndexProvider = StateProvider<int>((ref) => 0);

class DripNoteApp extends StatelessWidget {
  const DripNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'DripNote',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      routerConfig: router,
    );
  }
}

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {

  static const List<Widget> _pages = [
    RecipeListPage(),
    BeanManagementPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(mainScreenIndexProvider);

    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap:(value) {
          setState(() {
            ref.watch(mainScreenIndexProvider.notifier).state = value;
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