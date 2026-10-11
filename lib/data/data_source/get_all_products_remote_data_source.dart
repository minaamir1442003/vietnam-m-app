import 'package:injectable/injectable.dart';
import 'package:project_one/data/model/products_response_model.dart';

import '../../core/network/api_client.dart';

abstract class GetAllProductsRemoteDataSource {
  Future<ProductListDataModel> getProducts(int categoryId);
}

@Injectable(as: GetAllProductsRemoteDataSource)
class GetAllProductsRemoteDataSourceImpl
    implements GetAllProductsRemoteDataSource {
  final ApiClient _apiClient;

  GetAllProductsRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ProductListDataModel> getProducts(int categoryId) async {
    final response = await _apiClient.getProducts(categoryId);
    return response.data;
  }
}
