import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:recipes/app/features/home/data/datasources/home_data_provider.dart';
import 'package:recipes/core/network/network_info.dart';
import 'package:recipes/core/parameters/fetch_recipe_params.dart';

import 'home_data_provider_test.mocks.dart';



@GenerateMocks([NetworkInfo])
void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); //Ensures that async functions runs completely in the main function
  late HomeDataProviderImpl sut;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    sut = HomeDataProviderImpl(networkInfo: mockNetworkInfo);
  });

  const fetchRecipeParams = FetchRecipeParams(ingredients: ["Ham"]);

  test('should check if the device is online', () {
    //arrange
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    //act
    sut.fetchRecipes(params: fetchRecipeParams);
    //assert
    verify(mockNetworkInfo.isConnected);
  });
}
