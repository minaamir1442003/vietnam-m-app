import 'package:injectable/injectable.dart';
import 'package:project_one/core/common/result.dart';
import 'package:project_one/core/network/api_execute.dart';
import 'package:project_one/data/data_source/home_tab_remote_data_source.dart';
import 'package:project_one/data/model/home_tab_response_model.dart';

abstract class HomeTabRepository {
  Future<Result<HomeDataModel>> getHomeData();
}

@Injectable(as: HomeTabRepository)
class HomeTabRepositoryImpl implements HomeTabRepository {
  final HomeTabRemoteDataSource _dataSource;

  HomeTabRepositoryImpl(this._dataSource);

  @override
  Future<Result<HomeDataModel>> getHomeData() {
    return executeApi(() async {
      var response = await _dataSource.getHomeData();
      return response;
    });
  }
}
