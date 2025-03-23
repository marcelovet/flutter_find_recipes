import 'package:colorize_lumberdash/colorize_lumberdash.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_find_recipes/utils.dart';
import 'package:logging/logging.dart' as system_log;
import 'package:lumberdash/lumberdash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  _setupLogging();
  WidgetsFlutterBinding.ensureInitialized(); // binding between Flutter and OS
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive); // hide status bar
  if (isDesktop()) {
    await DesktopWindow.setWindowSize(const Size(600, 600));
    await DesktopWindow.setMinWindowSize(const Size(260, 600));
  }
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
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
    return PlatformMenuBar(
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
        theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),       
      ),
    );
  }
}