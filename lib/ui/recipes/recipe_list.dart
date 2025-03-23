import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_find_recipes/data/models/models.dart';

import '../widgets/common.dart';

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
  // TODO: add a RecipeResponse
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
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}