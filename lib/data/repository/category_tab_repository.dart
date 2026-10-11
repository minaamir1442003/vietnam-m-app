import 'package:injectable/injectable.dart';
import 'package:project_one/core/common/result.dart';
import 'package:project_one/core/network/api_execute.dart';
import 'package:project_one/data/data_source/category_tab_remote_data_source.dart';
import 'package:project_one/data/model/get_all_categories_response.dart';

abstract class CategoryTabRepository {
  Future<Result<List<CategoryDataResponse>>> getAllCategories();
}

@Injectable(as: CategoryTabRepository)
class CategoryTabRepositoryImpl implements CategoryTabRepository {
  final CategoryTabRemoteDataSource _dataSource;

  CategoryTabRepositoryImpl(this._dataSource);

  @override
  Future<Result<List<CategoryDataResponse>>> getAllCategories() {
    return executeApi(() async {
      var data = await _dataSource.getAllCategories();
      return data;
    });
  }
}
