import 'package:injectable/injectable.dart';
import 'package:project_one/core/network/api_client.dart';

import '../model/find_users_response_model.dart';

abstract class FindUsersRemoteDataSource {
  Future<FindUsersResponseModel> findUsers({
    required String locationFilter,
    required int page,
  });
}
@ Injectable(as: FindUsersRemoteDataSource)
class FindUsersRemoteDataSourceImpl implements FindUsersRemoteDataSource {
  final ApiClient _apiClient;

  FindUsersRemoteDataSourceImpl(this._apiClient);

  @override
  Future<FindUsersResponseModel> findUsers({
    required String locationFilter,
    required int page,
  }) {
    return _apiClient.findUsers(locationFilter, page);
  }
}
