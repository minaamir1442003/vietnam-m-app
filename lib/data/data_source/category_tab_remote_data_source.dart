import 'package:injectable/injectable.dart';
import 'package:project_one/core/network/api_client.dart';
import 'package:project_one/data/model/get_all_categories_response.dart';

abstract class CategoryTabRemoteDataSource {
  Future<List<CategoryDataResponse>> getAllCategories();
}

@Injectable(as: CategoryTabRemoteDataSource)
class CategoryTabRemoteDataSourceImpl implements CategoryTabRemoteDataSource {
  final ApiClient _apiClient;

  CategoryTabRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<CategoryDataResponse>> getAllCategories() async {
    final response = await _apiClient.getAllCategories();
    return response.data!;
  }
}
