import 'package:injectable/injectable.dart';
import 'package:project_one/core/common/result.dart';
import 'package:project_one/core/network/api_execute.dart';
import 'package:project_one/data/data_source/prize_tab_remote_data_source.dart';
import 'package:project_one/data/model/home_tab_response_model.dart';

import '../model/prize_tab_response_model.dart';

abstract class PrizeTabRepository {
  Future<Result<List<PrizeResponseModel>>> getAllPrizes();

  Future<Result<ExchangePrizeResponseModel>> exchangePrize(int prizeId);
}

@Injectable(as: PrizeTabRepository)
class PrizeTabRepositoryImpl implements PrizeTabRepository {
  final PrizeTabRemoteDataSource _dataSource;

  PrizeTabRepositoryImpl(this._dataSource);

  @override
  Future<Result<List<PrizeResponseModel>>> getAllPrizes() async {
    return executeApi(() async {
      var response = await _dataSource.getPrizeData();
      return response;
    });
  }

  @override
  Future<Result<ExchangePrizeResponseModel>> exchangePrize(int prizeId) {
    return executeApi(() async {
      return await _dataSource.exchangePrize(prizeId);
    },);
  }
}
