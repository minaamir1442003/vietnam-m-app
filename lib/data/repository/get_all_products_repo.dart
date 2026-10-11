import 'package:injectable/injectable.dart';
import 'package:project_one/core/common/result.dart';

import '../../core/network/api_execute.dart';
import '../data_source/get_all_products_remote_data_source.dart';
import '../model/products_response_model.dart';

abstract class GetAllProductsRepo {
  Future<Result<ProductListDataModel>> getProducts(int categoryId);
}

@Injectable(as: GetAllProductsRepo)
class GetAllProductsRepoImpl implements GetAllProductsRepo {
  final GetAllProductsRemoteDataSource _remoteDataSource;

  GetAllProductsRepoImpl(this._remoteDataSource);

  @override
  Future<Result<ProductListDataModel>> getProducts(int categoryId) async {
    return executeApi(() async {
      return await _remoteDataSource.getProducts(categoryId);
    });
  }
}
