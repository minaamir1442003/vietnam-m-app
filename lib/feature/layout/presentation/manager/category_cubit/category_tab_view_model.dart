import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/result.dart';
import '../../../../../data/repository/category_tab_repository.dart';
import 'category_tab_state.dart';

@injectable
class CategoryTabViewModel extends Cubit<CategoryTabState> {
  CategoryTabViewModel(this.repository) : super(CategoryTabInitial());
  final CategoryTabRepository repository;

  Future<void> getAllCategories() async {
    emit(CategoryTabLoading());
    final result = await repository.getAllCategories();
    switch (result) {
      case Success():
        emit(CategoryTabSuccess(categories: result.data!));
        break;
      case Error():
        emit(CategoryTabError(message: result.message.toString()));
        break;
    }
  }
}
