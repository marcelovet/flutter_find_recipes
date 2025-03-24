import 'package:colorize_lumberdash/colorize_lumberdash.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart' as system_log;
import 'package:lumberdash/lumberdash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'recipe_finder_app.dart';
import 'providers.dart';
import 'utils.dart';

Future<void> main() async {
  _setupLogging();
  WidgetsFlutterBinding.ensureInitialized(); // binding between Flutter and OS
   // hide status bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  if (isDesktop()) {
    await DesktopWindow.setWindowSize(const Size(1600, 1200));
    await DesktopWindow.setMinWindowSize(const Size(260, 600));
  }
  final sharedPrefs = await SharedPreferences.getInstance();
  runApp(ProviderScope(
    overrides: [
      sharedPrefProvider.overrideWithValue(sharedPrefs),
    ],
    child: RecipeFinder(),
  )); // for state management
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
