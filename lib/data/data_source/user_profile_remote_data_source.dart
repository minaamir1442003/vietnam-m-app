import 'package:injectable/injectable.dart';
import 'package:project_one/core/network/api_client.dart';
import 'package:project_one/data/model/user_profile_response_model.dart';

import '../model/update_user_response_model.dart';

abstract class UserProfileRemoteDataSource {
  Future<UserProfileResponseModel> getUserProfile();

  Future<void> logout();

  Future<void> deleteAccount();

  Future<UpdateProfileResponseModel> updateUserProfile(
    UpdateProfileRequestModel data,
  );
}

@Injectable(as: UserProfileRemoteDataSource)
class UserProfileRemoteDataSourceImpl implements UserProfileRemoteDataSource {
  final ApiClient _apiClient;

  UserProfileRemoteDataSourceImpl(this._apiClient);

  @override
  Future<UserProfileResponseModel> getUserProfile() async {
    final response = await _apiClient.getUserProfile();
    return response;
  }

  @override
  Future<void> logout() async {
    return await _apiClient.logout();
  }

  @override
  Future<void> deleteAccount() async {
    return await _apiClient.deleteAccount();
  }

  @override
  Future<UpdateProfileResponseModel> updateUserProfile(
      UpdateProfileRequestModel data,
      ) async {
    final response = await _apiClient.updateUserProfile(
      data.firstname,
      data.lastname,
      data.email,
      data.phone,
      data.image,
    );
    return response;
  }
}
