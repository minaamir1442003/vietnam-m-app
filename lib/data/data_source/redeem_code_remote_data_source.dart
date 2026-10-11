import 'package:injectable/injectable.dart';

import '../../core/network/api_client.dart';
import '../model/redeem_code_response_code.dart';

abstract class RedeemCodeRemoteDataSource {
  Future<RedeemCodeResponseModel> redeemCode(String code);
}

@Injectable(as: RedeemCodeRemoteDataSource)
class RedeemCodeRemoteDataSourceImpl implements RedeemCodeRemoteDataSource {
  final ApiClient _apiClient;

  RedeemCodeRemoteDataSourceImpl(this._apiClient);

  @override
  Future<RedeemCodeResponseModel> redeemCode(String code) async {
    return await _apiClient.redeemCode({'code': code});
  }
}
