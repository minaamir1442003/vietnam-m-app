import 'package:injectable/injectable.dart';
import 'package:project_one/core/network/api_client.dart';
import 'package:project_one/data/model/home_tab_response_model.dart';

import '../model/prize_tab_response_model.dart';

abstract class PrizeTabRemoteDataSource {
  Future<List<PrizeResponseModel>> getPrizeData();
  Future<ExchangePrizeResponseModel>exchangePrize(int prizeId);
}

@Injectable(as: PrizeTabRemoteDataSource)
class PrizeTabRemoteDataSourceImpl implements PrizeTabRemoteDataSource {
  PrizeTabRemoteDataSourceImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<List<PrizeResponseModel>> getPrizeData() async{
    var response=await _apiClient.getPrizeData();
    return response.data??[];
  }

  @override
  Future<ExchangePrizeResponseModel> exchangePrize(int prizeId)async {
return await _apiClient.exchangePrize({
  "prize_id":prizeId
});
  }
}
