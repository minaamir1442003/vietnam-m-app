import 'package:injectable/injectable.dart';
import 'package:project_one/core/network/api_client.dart';
import 'package:project_one/data/model/home_tab_response_model.dart';

abstract class HomeTabRemoteDataSource{
  Future<HomeDataModel> getHomeData();
}
@Injectable(as: HomeTabRemoteDataSource)
class HomeTabRemoteDataSourceImpl implements HomeTabRemoteDataSource {
  final ApiClient _apiClient;
  HomeTabRemoteDataSourceImpl(this._apiClient);
  @override
  Future<HomeDataModel> getHomeData() async{
    var response =await _apiClient.getHomeData();
    return response.data!;
  }

}