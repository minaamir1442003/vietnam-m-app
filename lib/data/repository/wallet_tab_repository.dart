import 'package:injectable/injectable.dart';
import 'package:project_one/core/common/result.dart';
import 'package:project_one/core/network/api_execute.dart';
import 'package:project_one/data/model/wallet_tab_response_model.dart';

import '../data_source/wallet_tab_remote_data_source.dart';

abstract class WalletTabRepository {
  Future<Result<WalletDataModel>> getWalletData(int page);
}

@Injectable(as: WalletTabRepository)
class WalletTabRepositoryImpl implements WalletTabRepository {
  final WalletTabRemoteDataSource _remoteDataSource;

  WalletTabRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<WalletDataModel>> getWalletData(int page) async {
    return executeApi(() async {
      var response = await _remoteDataSource.getWalletData(page);
      return response.data;
    });
  }
}
