import 'dart:async';
import 'package:chopper/chopper.dart';

//import '../data/models/models.dart';
//import '../mock_service/mock_service.dart';
import 'model_response.dart';
import 'query_result.dart';
import 'service_interface.dart';
import 'spoonacular_converter.dart';
import '../data/models/models.dart';

part 'spoonacular_service.chopper.dart';

const String apiKey = 'd609223568e64e61b4c67cdbf21b9330';
const String apiUrl = 'https://api.spoonacular.com';

@ChopperApi()
abstract class SpoonacularService extends ChopperService 
  implements ServiceInterface {
  
  @override
  @GET(path: 'recipes/complexSearch')
  Future<RecipeResponse> queryRecipes(
    @Query('query') String query,
    @Query('offset') int offset,
    @Query('number') int number,
  );

  @override
  @GET(path: 'recipes/{id}/information?includeNutrition=false')
  Future<RecipeDetailsResponse> queryRecipe(
    @Path('id') String id,
  );

  static SpoonacularService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(apiUrl),
      interceptors: [QueryInterceptor(), HttpLoggingInterceptor()],
      converter: SpoonacularConverter(),
      errorConverter: JsonConverter(),
      services: [
        _$SpoonacularService(),
      ]
    );
    return _$SpoonacularService(client);
  }
}

class QueryInterceptor implements Interceptor {
  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(
    Chain<BodyType> chain
  ) async {
    final request = chain.request;
    final params = Map<String, dynamic>.from(request.parameters);
    params['apiKey'] = apiKey;
    final response = await chain.proceed(request.copyWith(parameters: params));
    return response;
  }
}
