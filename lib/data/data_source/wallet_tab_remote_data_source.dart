import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

import '../../core/utils/constant_manager.dart';
import '../model/wallet_tab_response_model.dart';

abstract class WalletTabRemoteDataSource {
  Future<WalletResponseModel> getWalletData(int page);
}

@Injectable(as: WalletTabRemoteDataSource)
class WalletTabRemoteDataSourceImpl implements WalletTabRemoteDataSource {
  final Dio _dio;

  WalletTabRemoteDataSourceImpl(this._dio);

  @override
  Future<WalletResponseModel> getWalletData(int page) async {
    final response = await _dio.get(
      '${AppConstants.baseUrl}/api/v1/wallet',
      queryParameters: {'page': page},
    );
    return WalletResponseModel.fromJson(response.data);
  }
}
