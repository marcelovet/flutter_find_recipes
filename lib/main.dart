import 'package:colorize_lumberdash/colorize_lumberdash.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart' as system_log;
import 'package:lumberdash/lumberdash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_find_recipes/ui/theme/theme.dart';
import 'package:flutter_find_recipes/utils.dart';
import 'package:flutter_find_recipes/ui/main_screen.dart';

Future<void> main() async {
  _setupLogging();
  WidgetsFlutterBinding.ensureInitialized(); // binding between Flutter and OS
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive); // hide status bar
  if (isDesktop()) {
    await DesktopWindow.setWindowSize(const Size(600, 600));
    await DesktopWindow.setMinWindowSize(const Size(260, 600));
  }
  // TODO Add Shared Preferences
  runApp(const ProviderScope(child: RecipeFinder(),)); // for state management
}

void _setupLogging() {
  putLumberdashToWork(withClients: [
    ColorizeLumberdash(),
  ]);
  system_log.Logger.root.level = system_log.Level.ALL;
  system_log.Logger.root.onRecord.listen((rec) {
      debugPrint('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class RecipeFinder extends StatefulWidget {
  const RecipeFinder({super.key});

  @override
  State<RecipeFinder> createState() => _RecipeFinderState();
}

class _RecipeFinderState extends State<RecipeFinder> {
  ThemeMode currentMode = ThemeMode.light;
  
  @override
  Widget build(BuildContext context) {
    return PlatformMenuBar( // only shows up on MacOS
      menus: [
        PlatformMenu(
          label: 'File',
          menus: [
            PlatformMenuItem(
              label: 'Dark Mode',
              onSelected: () {
                setState(() {
                  currentMode = ThemeMode.dark;
                });
              }
            ),
            PlatformMenuItem(
              label: 'Light Mode',
              onSelected: () {
                setState(() {
                  currentMode = ThemeMode.light;
                });
              }
            ),
            PlatformMenuItem(
              label: 'Quit',
              onSelected: () {
                setState(() {
                  SystemNavigator.pop();
                });
              },
              shortcut: const SingleActivator(LogicalKeyboardKey.keyQ, meta: true),
            ),
          ],
        )
      ],
      child: MaterialApp(
        title: 'Recipe Finder',
        debugShowCheckedModeBanner: false,
        themeMode: currentMode,
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        home: const MainScreen(title: 'Flutter Demo Home Page'),       
      ),
    );
  }
}