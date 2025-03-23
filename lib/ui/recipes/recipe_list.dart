import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/models.dart';
import '../../network/model_response.dart';
import '../../network/query_result.dart';
import '../../network/service_interface.dart';
import '../bookmarks/bookmarks.dart';
import '../theme/colors.dart';
import '../widgets/common.dart';
import '../widgets/custom_dropdown.dart';
import 'recipe_details.dart';

enum ListType {all, bookmarks}

class RecipeList extends ConsumerStatefulWidget {
  const RecipeList({super.key});

  @override
  ConsumerState<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends ConsumerState<RecipeList> {
  // TODO Add Search Index Key

  late TextEditingController searchTextController;
  final ScrollController _scrollController = ScrollController();
  List<Recipe> currentSearchList = [];
  int currentCount = 0;
  int currentStartPosition = 0;
  int currentEndPosition = 20;
  int pageCount = 20;
  bool hasMore = false;
  bool loading = false;
  bool inErrorState = false;
  List<String> previousSearches = <String>[];
  ListType currentType = ListType.all;
  Future<RecipeResponse>? currentResponse;
  bool newDataRequired = true;
  
  @override
  void dispose() {
    searchTextController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void savePreviousSearches() async {
    // TODO Save Current Index
  }

  void getPreviousSearches() async {
    // TODO Get Current Index
  }
  
  @override
  void initState() {
    super.initState();
    getPreviousSearches();
    
    searchTextController = TextEditingController(text: '');
    _scrollController.addListener(() {
      if (currentType == ListType.all) {
        final triggerFetchMoreSize =
            0.7 * _scrollController.position.maxScrollExtent;
        
        if (_scrollController.position.pixels > triggerFetchMoreSize) {
          if (
            hasMore &&
            currentEndPosition < currentCount &&
            !loading &&
            !inErrorState
          ) {
            setState(() {
              loading = true;
              newDataRequired = true;
              currentStartPosition = currentEndPosition;
              currentEndPosition = min(
                currentStartPosition + pageCount,
                currentCount
              );
            });
          }
        }
      }
    });
  }
  
  Future<RecipeResponse> fetchData() async {
    if(!newDataRequired && currentResponse != null) {
      return currentResponse!;
    }
    newDataRequired = false;
    // TODO: Load Recipes
    /*
        final recipeService = ref.watch(serviceProvider);
        currentResponse = recipeService.queryRecipes(
            searchTextController.text.trim(), currentStartPosition, pageCount);
        return currentResponse!;
    */
    const apiQueryResults = QueryResult(
      offset: 0,
      number: 0,
      totalResults: 0,
      recipes: <Recipe>[],
    );
    return Success(apiQueryResults);
  }

  void startSearch(String value) {
    setState(() {
      currentSearchList.clear();
      newDataRequired = true;
      currentCount = 0;
      currentEndPosition = pageCount;
      currentStartPosition = 0;
      hasMore = false;
      value = value.trim();
      if (!previousSearches.contains(value)) {
        previousSearches.add(value);
        savePreviousSearches();
      }
    });
  }
  
  
  Widget _buildHeader() {
    return SizedBox(
      height: 160.0,
      child: ClipRRect(
        borderRadius: allBorderCircular8,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: lightGreen,
              ),
            ),
            Center(
              child: Image.asset(
                'assets/images/background2.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildTypePicker() {
    return IntrinsicWidth(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SegmentedButton(
              segments: const <ButtonSegment<ListType>>[
                ButtonSegment(
                  value: ListType.all,
                  label: Text('All'),
                  enabled: true,
                ),
                ButtonSegment(
                  value: ListType.bookmarks,
                  label: Text('Bookmarks'),
                  enabled: true,
                ),
              ],
              selected: {currentType},
              onSelectionChanged: (Set<ListType> newSelection) {
                setState(() {
                  currentType = newSelection.first;
                });
              },
            )
          ],
        ),
      ),
    );
  }
  
  Widget _buildSearchCard() {
    return Card(
      elevation: 4.0,
      shape: const RoundedRectangleBorder(
        borderRadius: allBorderCircular8,
      ),
      child: Padding(
        padding: allPadding4,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                startSearch(searchTextController.text);
                final currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              icon: const Icon(Icons.search),
            ),
            sizedW8,
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                      autofocus: false,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (value) {
                        startSearch(searchTextController.text);
                      },
                      controller: searchTextController,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        searchTextController.text = '';
                      });
                    },
                    icon: const Icon(Icons.close),
                  ),
                  PopupMenuButton<String>(
                    itemBuilder: (BuildContext context) {
                      return previousSearches
                        .map<CustomDropdownMenuItem<String>>(
                          (String value) {
                            return CustomDropdownMenuItem<String>(
                              text: value,
                              value: value,
                              callback: () {
                                setState(() {
                                  previousSearches.remove(value);
                                  savePreviousSearches();
                                  Navigator.pop(context);
                                });
                              },
                            );
                          }
                        )
                        .toList();
                    },
                    onSelected: (String value) {
                      searchTextController.text = value;
                      startSearch(searchTextController.text);
                    },
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: lightGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildRecipeCard(
    BuildContext topLevelContext,
    List<Recipe> recipes,
    int index,
  ) {
    final recipe = recipes[index];
    return GestureDetector(
      onTap: () => Navigator.push(
        topLevelContext,
        MaterialPageRoute(
          builder: (context) => RecipeDetails(recipe: recipe),
        ),
      ),
      // add  recipe card
      child: Container(),
    );
  }
  
  Widget _buildRecipeList(
    BuildContext recipeListContext,
    List<Recipe> recipes,
  ) {
    return SliverLayoutBuilder(
      builder: (BuildContext context, SliverConstraints constraints) {
        final numColumns = max(1, constraints.crossAxisExtent ~/ 264);
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return _buildRecipeCard(
                recipeListContext,
                recipes,
                index,
              );
            },
            childCount: recipes.length,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: numColumns,
            mainAxisExtent: 264,
          ),
        );
      },
    );
  }
  
  Sliver _buildRecipeLoader(BuildContext context) {
    if (searchTextController.text.length < 3) return emptySliverWidget;
    return FutureBuilder<RecipeResponse>(
      future: fetchData(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          if(snapshot.hasError) {
            return SliverFillRemaining(
              child: Center(
                child: Text(
                  snapshot.error.toString(),
                  textAlign: TextAlign.center,
                  textScaler: TextScaler.linear(1.3),
                ),
              ),
            );
          }

          loading = false;
          final result = snapshot.data;
          
          if(result is Error) {
            const errorMessage = 'Problems getting data';
            return const SliverFillRemaining(
              child: Center(
                child: Text(
                  errorMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            );
          }

          final query = (result as Success).value as QueryResult;
          inErrorState = false;
          currentCount = query.totalResults;
          hasMore = query.totalResults > (query.offset + query.number);
          currentSearchList.addAll(query.recipes);
          currentEndPosition =
              min(query.totalResults, currentEndPosition + query.number);
          if (currentCount == 0) {
            return const SliverFillRemaining(
              child: Center(
                child: Text(
                  'No Results',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            );
          } else {
            return _buildRecipeList(context, currentSearchList);
          }
        } else {
          if(currentCount == 0) {
            return const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return _buildRecipeList(context, currentSearchList);
          }
        }
      }
    );
  }
  
  Widget buildScrollList(List<Widget> topList, Widget bottomWidget) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...topList,
        ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(
            dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
            physics: const ClampingScrollPhysics(),
          ),
          child: Expanded(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverPadding(
                  padding: allPadding8,
                  sliver: bottomWidget,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
  
  Widget buildRecipeList() {
    return buildScrollList(
      [_buildHeader(), _buildTypePicker(), _buildSearchCard()],
      _buildRecipeLoader(context)
    );
  }

  Widget buildBookmarkList() {
    return buildScrollList([
      _buildHeader(),
      _buildTypePicker(),
    ], const Bookmarks());
  }
  
  @override
  Widget build(BuildContext context) {
    return switch (currentType) {
      ListType.all => buildRecipeList(),
      ListType.bookmarks => buildBookmarkList()
    };
  }
}