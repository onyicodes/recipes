import 'package:equatable/equatable.dart';

class RecipeEntity extends Equatable {
  const RecipeEntity({
    required this.title,
    required this.ingredients,
  });

  final String title;
  final List ingredients;

  @override
  List<Object?> get props => [
        title,
        ingredients,
      ];
}
