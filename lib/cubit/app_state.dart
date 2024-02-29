part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

class GetBrandsLogosLoadingState extends AppState {}

class GetBrandsLogosSuccessState extends AppState {}

class GetBrandsLogosFailureState extends AppState {}

class GetCategoriesLoadingState extends AppState {}

class GetCategoriesSuccessState extends AppState {}

class GetCategoriesFailureState extends AppState {}

class GetBrandsLoadingState extends AppState {}

class GetBrandsSuccessState extends AppState {}

class GetBrandsFailureState extends AppState {}
