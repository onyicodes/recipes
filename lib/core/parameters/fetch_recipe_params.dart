import 'package:equatable/equatable.dart';

class FetchRecipeParams extends Equatable {
  final String ingredients;

  const FetchRecipeParams(
      {required this.ingredients,});

  Map<String, dynamic> toMap() => {
        "ingredients": ingredients,
      };
  @override
  List<Object?> get props => [
    ingredients
  ];
}
