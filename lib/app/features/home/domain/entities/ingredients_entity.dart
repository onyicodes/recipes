

import 'package:equatable/equatable.dart';

class IngredientEntity extends Equatable {
  const IngredientEntity({
    required this.title,
    required this.useby,
  });

  final String title;
  final String useby;

  @override
  List<Object?> get props => [
        title,
        useby,
      ];
}
