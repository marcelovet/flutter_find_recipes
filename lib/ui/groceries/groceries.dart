import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/ingredient.dart';
import '../theme/colors.dart';
import '../widgets/common.dart';
import '../widgets/ingredient_card.dart';

class GroceriesList extends ConsumerStatefulWidget {
  const GroceriesList({super.key});

  @override
  ConsumerState<GroceriesList> createState() => _GroceriesListState();
}

class _GroceriesListState extends ConsumerState<GroceriesList> {
  final checkBoxValues = <int, bool>{};
  late TextEditingController searchTextController;
  bool showAll = true;
  List<Ingredient> currentIngredients = [];
  bool searching = false;
  List<Ingredient> searchIngredients = [];
  final ScrollController _scrollController = ScrollController();
  final searchFocusNode = FocusNode();
  
  @override
  void initState() {
    super.initState();
    searchTextController = TextEditingController(text: '');
    // TODO: Add Ingredient Stream
  }

  @override
  void dispose() {
    searchTextController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
  
  void startSearch(String searchString) {
    searching = searchString.isNotEmpty;
    searchIngredients = currentIngredients
        .where((element) => true == element.name?.contains(searchString))
        .toList();
    setState(() {});
  }
  
  Widget _buildHeader() {
    return SizedBox(
      height: 160.0,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: background1Color,
            ),
          ),
          Center(
            child: Image.asset(
              'assets/images/background1.png',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget buildSearchRow() {
    return Row(
      children: [
        sizedW8,
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            startSearch(searchTextController.text);
          },
        ),
        sizedW8,
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search...',
                  ),
                  focusNode: searchFocusNode,
                  autofocus: true,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (value) => startSearch(searchTextController.text),
                  controller: searchTextController,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            setState(() {
              searching = false;
              searchTextController.text = '';
            });
          },
        ),
        PopupMenuButton<String>(
          icon: const Icon(Icons.filter_list),
          onSelected: (String value) {
            setState(() {
              showAll = value == 'All';
            });
          },
          itemBuilder: (BuildContext context) {
            return [
              CheckedPopupMenuItem(
                value: 'All',
                checked: showAll,
                child: const Text('All'),
              ),
              CheckedPopupMenuItem(
                value: 'Need',
                checked: !showAll,
                child: const Text('Need/Have'),
              ),
            ];
          },
        ),
        sizedW8,
      ],
    );
  }
  
  Widget createIngredientCard(
    Ingredient ingredient,
    Map<int, bool>? checkBoxValues,
    bool checked,
    int index,
    bool showCheckbox
  ) {
    final even = index % 2 == 0;
    return Padding(
      padding: allPadding8,
      child: IngredientCard(
        name: ingredient.name ?? '',
        initiallyChecked: checked,
        evenRow: even,
        showCheckbox: showCheckbox,
        onChecked: (newValue) {
          checkBoxValues?[index] = newValue;
        }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}