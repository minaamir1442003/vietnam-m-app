import 'package:injectable/injectable.dart';
import 'package:project_one/core/common/result.dart';
import 'package:project_one/core/network/api_execute.dart';
import 'package:project_one/data/data_source/user_profile_remote_data_source.dart';
import 'package:project_one/data/model/update_user_response_model.dart';
import 'package:project_one/data/model/user_profile_response_model.dart';

abstract class UserProfileRepository {
  Future<Result<UserResponseModel>> getUserProfile();

  Future<Result<void>> logout();

  Future<Result<void>> deleteAccount();

  Future<Result<UserResponseModel>> updateUserProfile(
      UpdateProfileRequestModel data);
}

@Injectable(as: UserProfileRepository)
class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserProfileRemoteDataSource _dataSource;

  UserProfileRepositoryImpl(this._dataSource);

  @override
  Future<Result<UserResponseModel>> getUserProfile() {
    return executeApi(() async {
      final response = await _dataSource.getUserProfile();
      return response.data!.user!;
    });
  }

  @override
  Future<Result<void>> logout() {
    return executeApi(
          () async {
        return await _dataSource.logout();
      },
    );
  }

  @override
  Future<Result<void>> deleteAccount() {
    return executeApi(
          () async {
        return await _dataSource.deleteAccount();
      },
    );
  }

  @override
  Future<Result<UserResponseModel>> updateUserProfile(
      UpdateProfileRequestModel data) {
    return executeApi(
          () async {
        var response = await _dataSource.updateUserProfile(data);
        return response.data;
      },
    );
  }
}
