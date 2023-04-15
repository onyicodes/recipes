import 'package:get/get_connect/connect.dart';
import 'package:recipes/app/features/home/data/model/ingredient_model.dart';
import 'package:recipes/app/features/home/data/model/recipes_model.dart';
import 'package:recipes/app/features/home/domain/entities/ingredients_entity.dart';
import 'package:recipes/app/features/home/domain/entities/recipe_entity.dart';
import 'package:recipes/core/constants/api_url/api_url.dart';
import 'package:recipes/core/error/exceptions.dart';
import 'package:recipes/core/network/network_info.dart';
import 'package:recipes/core/parameters/fetch_recipe_params.dart';

abstract class HomeDataProvider extends GetConnect {
  Future<List<RecipeEntity>> fetchRecipes({required FetchRecipeParams params});
  Future<List<IngredientEntity>> fetchIngredients();
}

class HomeDataProviderImpl extends HomeDataProvider {
  final NetworkInfo networkInfo;

  HomeDataProviderImpl({required this.networkInfo});
// Get request
  @override
  Future<List<RecipeEntity>> fetchRecipes(
      {required FetchRecipeParams params}) async {
    

    if (await networkInfo.isConnected) {
      Map<String, dynamic> queryParams = params.toMap();
    const String recipesUrl = ApiUrls.baseUrl + ApiUrls.recipes;
      final Response response = await get(
        recipesUrl,
        query: queryParams,
      );


      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> jsonString;
        jsonString = response.body;
        final List<RecipeModel> dealsModesList = [];
        for (Map<String, dynamic> recipe in jsonString) {
          dealsModesList.add(RecipeModel.fromMap(recipe));
        }

        return dealsModesList;
      } else if (response.statusCode == 400) {
        throw BadRequestException();
      } else if (response.statusCode == 404) {
        throw NotFoundException();
      } else if (response.statusCode == 403) {
        throw ForbiddenException();
      } else if (response.statusCode == 500) {
        throw ServerException();
      } else {
        throw UnknownException();
      }
    } else {
      throw NetworkException();
    }
  }


  @override
  Future<List<IngredientModel>> fetchIngredients() async {
    const String ingredientsUrl = ApiUrls.baseUrl + ApiUrls.ingredients;

    if (await networkInfo.isConnected) {
      final Response response = await get(
        ingredientsUrl,
      );

      

      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> jsonString;
        jsonString = response.body;
        final List<IngredientModel> dealsModesList = [];
        for (Map<String, dynamic> recipe in jsonString) {
          dealsModesList.add(IngredientModel.fromMap(recipe));
        }

        return dealsModesList;
      } else if (response.statusCode == 400) {
        throw BadRequestException();
      } else if (response.statusCode == 404) {
        throw NotFoundException();
      } else if (response.statusCode == 403) {
        throw ForbiddenException();
      } else if (response.statusCode == 500) {
        throw ServerException();
      } else {
        throw UnknownException();
      }
    } else {
      throw NetworkException();
    }
  }

}
