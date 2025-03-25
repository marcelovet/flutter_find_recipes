import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

//import '../data/models/models.dart';
//import '../mock_service/mock_service.dart';
import 'model_response.dart';
import 'query_result.dart';
import 'service_interface.dart';
import 'spoonacular_model.dart';

const String apiKey = 'd609223568e64e61b4c67cdbf21b9330';
const String apiUrl = 'https://api.spoonacular.com';

class SpoonacularService implements ServiceInterface {
  Future getData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) return response.body;
    log(response.statusCode.toString());
  }

  @override
  Future<RecipeResponse> queryRecipes(
    String query,
    int offset,
    int number,
  ) async {
    final recipeData = await getData(
      '$apiUrl/recipes/complexSearch?apiKey=$apiKey&query=$query&offset=$offset&number=$number',
    );
    final spoonacularResults = SpoonacularResults.fromJson(
      jsonDecode(recipeData)
    );
    final recipes = spoonacularResultsToRecipe(spoonacularResults);
    final apiQueryResults = QueryResult(
      offset: spoonacularResults.offset,
      number: spoonacularResults.number,
      totalResults: spoonacularResults.totalResults,
      recipes: recipes,
    );
    return Success(apiQueryResults);
  }

  @override
  Future<RecipeDetailsResponse> queryRecipe(
    String id,
  ) {
    // TODO: implement queryRecipe
    throw UnimplementedError();
  }
}