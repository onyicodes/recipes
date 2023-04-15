import 'package:dartz/dartz.dart';
import 'package:recipes/app/features/home/domain/entities/ingredients_entity.dart';
import 'package:recipes/app/features/home/domain/repositories/home_repositories.dart';
import 'package:recipes/core/error/failures.dart';
import 'package:recipes/core/parameters/no_params.dart';
import 'package:recipes/core/usecase/usecase_builder.dart';

class FetchIngredientsUsecase extends UseCase<List<IngredientEntity>, NoParams> {
  final HomeRepository repository;

  FetchIngredientsUsecase({required this.repository});

  @override
  Future<Either<Failure, List<IngredientEntity>>> call(NoParams params) async {
    return await repository.fetchIngredients();
  }
}
