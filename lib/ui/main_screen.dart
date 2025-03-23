import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_find_recipes/ui/theme/colors.dart';
import 'package:flutter_find_recipes/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key, required this.title});

  final String title;

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int _selectedIndex = 0;
  List<Widget> pageList = <Widget>[];
  // TODO Add Index Key
  
  @override
  void initState() {
    super.initState();
    // TODO create a RecipeList
    pageList.add(
      const Center(
        child: Text('Recipe List'),
      )
    );
    // TODO create a GroceryList
    pageList.add(
      const Center(
        child: Text('Grocery List'),
      )
    );
    getCurrentIndex();
  }

  void saveCurrentIndex() async {
    // TODO Save Current Index
  }

  void getCurrentIndex() async {
    // TODO Get Current Index
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    saveCurrentIndex();
  }

  List<NavigationRailDestination> getRailNavigations() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final selectedColor = isDarkMode ? Colors.white : Colors.black;
    return [
      NavigationRailDestination(
        icon: SvgPicture.asset(
          'assets/images/icon_recipe.svg',
          colorFilter: ColorFilter.mode(
            _selectedIndex == 0 ? selectedColor : Colors.black,
            BlendMode.srcIn,
          ),
          semanticsLabel: 'Recipes',
        ),
        label: const Text('Recipes', style: TextStyle(fontSize: 10)),
      ),
      NavigationRailDestination(
        icon: SvgPicture.asset(
          'assets/images/shopping_cart.svg',
          colorFilter: ColorFilter.mode(
            _selectedIndex == 0 ? selectedColor : Colors.black,
            BlendMode.srcIn,
          ),
          semanticsLabel: 'Groceries',
        ),
        label: const Text('Groceries', style: TextStyle(fontSize: 10)),
      ),
    ];
  }
  
  BottomNavigationBar createBottomNavigationBar() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final selectedColor = isDarkMode ? Colors.white : Colors.black;
    final unSelectedItemColor = isDarkMode ? Colors.white : Colors.grey;
    final backgroundColor = isDarkMode
      ? darkBackgroundColor : smallCardBackgroundColor;
    
    return BottomNavigationBar(
      backgroundColor: backgroundColor,
      currentIndex: _selectedIndex,
      selectedItemColor: selectedColor,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/images/icon_recipe.svg',
            colorFilter: ColorFilter.mode(
                _selectedIndex == 0 ? selectedColor : unSelectedItemColor,
                BlendMode.srcIn
            ),
            semanticsLabel: 'Recipes',
          ),
          label: 'Recipes',
        ),
        BottomNavigationBarItem(
          backgroundColor: _selectedIndex == 1
            ? iconBackgroundColor : Colors.black,
          icon: SvgPicture.asset(
            'assets/images/shopping_cart.svg',
            colorFilter: ColorFilter.mode(
                _selectedIndex == 1 ? selectedColor : unSelectedItemColor,
                BlendMode.srcIn
            ),
            semanticsLabel: 'Groceries',
          ),
          label: 'Groceries',
        ),
      ],
      onTap: _onItemTapped,
    );
  }
  
  Widget mobileLayout() {
    return Scaffold(
      bottomNavigationBar: createBottomNavigationBar(),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: pageList,
        )
      ),
    );
  }
  
  Widget largeLayout() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final selectedColor = isDarkMode
      ? darkBackgroundColor
      : smallCardBackgroundColor;
    return AdaptiveLayout(
      primaryNavigation: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.mediumAndUp: SlotLayout.from(
            key: const Key('primaryNavigation'),
            builder: (_) {
              return Container(
                decoration: BoxDecoration(color: selectedColor),
                child: AdaptiveScaffold.standardNavigationRail(
                  destinations: getRailNavigations(),
                  onDestinationSelected: (int index) => _onItemTapped(index),
                  selectedIndex: _selectedIndex,
                  labelType: NavigationRailLabelType.all,
                  backgroundColor: selectedColor,
                  selectedIconTheme: IconTheme.of(context)
                    .copyWith(color: iconBackgroundColor),
                  unselectedIconTheme: IconTheme.of(context)
                    .copyWith(color: Colors.black),
                ),
              );
            },
          ),
        }
      ),
      body: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig?>{
          Breakpoints.standard: SlotLayout.from(
            key: const Key('body'),
            builder: (_) {
              return Container(
                color: Colors.white,
                child: IndexedStack(
                  index: _selectedIndex,
                  children: pageList,
                ),
              );
            }
          )
        },
      ),
      bottomNavigation: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig?>{
          Breakpoints.small: SlotLayout.from(
            key: const Key('bottomNavigation'),
            builder: (_) => createBottomNavigationBar()
          ),
        }
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    if (isDesktop() || isWeb()) return largeLayout();
    return mobileLayout();
  }
}
