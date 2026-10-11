import '../../../../../data/model/get_all_categories_response.dart';

sealed class CategoryTabState {}

class CategoryTabInitial extends CategoryTabState {}

class CategoryTabLoading extends CategoryTabState {}

class CategoryTabSuccess extends CategoryTabState {
  List<CategoryDataResponse> categories;

  CategoryTabSuccess({required this.categories});
}

class CategoryTabError extends CategoryTabState {
  final String message;

  CategoryTabError({required this.message});
}
