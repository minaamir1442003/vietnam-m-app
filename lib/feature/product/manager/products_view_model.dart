import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one/data/model/products_response_model.dart';
import 'package:project_one/data/repository/get_all_products_repo.dart';
import 'package:project_one/feature/product/manager/products_state.dart';

import '../../../core/common/result.dart';

@injectable
class ProductsViewModel extends Cubit<ProductsState> {
  ProductsViewModel(this._repo) : super(ProductsInitial());
  final GetAllProductsRepo _repo;
  List<ProductModel> products = [];

  Future<void> getProductsByCategory(int categoryId) async {
    emit(ProductsLoading());
    final result = await _repo.getProducts(categoryId);
    switch (result) {
      case Success():
        products = result.data!.products;
        emit(ProductsSuccess(products));
        break;
      case Error():
        emit(ProductsError(result.message.toString()));
        break;
    }
  }
}
