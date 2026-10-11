import 'package:injectable/injectable.dart';

import '../../../../core/common/result.dart';
import '../../core/network/api_execute.dart';
import '../data_source/redeem_code_remote_data_source.dart';
import '../model/redeem_code_response_code.dart';

abstract class RedeemCodeRepository {
  Future<Result<RedeemCodeResponseModel>> redeemCode(
      String code,
      );
}

@Injectable(as: RedeemCodeRepository)
class RedeemCodeRepositoryImpl
    implements RedeemCodeRepository {
  final RedeemCodeRemoteDataSource _remoteDataSource;

  RedeemCodeRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<RedeemCodeResponseModel>> redeemCode(
      String code,
      ) async {
    return executeApi(() async {
      return await _remoteDataSource.redeemCode(code);
    });
  }
}
