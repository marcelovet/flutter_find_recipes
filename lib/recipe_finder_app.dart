import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/theme/theme.dart';
import 'ui/main_screen.dart';

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
              shortcut: const SingleActivator(
                LogicalKeyboardKey.keyQ, meta: true
              ),
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