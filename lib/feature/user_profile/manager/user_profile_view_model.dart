import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:project_one/core/common/result.dart';
import 'package:project_one/core/service/shared_pref_helper.dart';
import 'package:project_one/core/utils/constant_manager.dart';
import 'package:project_one/data/model/user_profile_response_model.dart';
import 'package:project_one/data/repository/user_profile_repository.dart';
import 'package:project_one/feature/user_profile/manager/user_profile_state.dart';
import '../../../generated/l10n.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileState> {
  final UserProfileRepository repository;

  ProfileViewModel(this.repository) : super(ProfileInitial());

  UserResponseModel? userModel;
  num? userPoints;

  Future<void> getUserProfile() async {
    emit(ProfileLoading());

    final result = await repository.getUserProfile();

    switch (result) {
      case Success():
        userModel = result.data;
        userPoints = num.tryParse(result.data?.points.toString() ?? '0') ?? 0;
        await SharedPrefHelper.setData(AppConstants.role, userModel!.minRole.toString());
        emit(ProfileLoaded(result.data!));
        break;
      case Error():
        emit(ProfileError(result.message ?? 'Failed to load profile'));
        break;
    }
  }

  void updatePoints(num newPoints) {
    userPoints = newPoints;

    if (userModel != null) {
      userModel = userModel!.copyWith(points: newPoints.toString());
    }

    emit(ProfilePointsUpdated(newPoints));
  }

  Future<void> logout() async {
    emit(LogoutLoadingState());

    final result = await repository.logout();

    switch (result) {
      case Success():
        await SharedPrefHelper.removeSecureString(AppConstants.token);
        userModel = null;
        userPoints = null;
        emit(LogoutSuccessState());
        break;

      case Error():
        emit(LogoutErrorState(result.message ?? 'Logout failed'));
        break;
    }
  }

  Future<void> deleteAccount() async {
    emit(DeleteAccountLoadingState());

    final result = await repository.deleteAccount();

    switch (result) {
      case Success():
        await SharedPrefHelper.removeSecureString(AppConstants.token);
        userModel = null;
        userPoints = null;
        emit(DeleteAccountSuccessState());
        break;

      case Error():
        emit(DeleteAccountErrorState(result.message ?? 'Delete account failed'));
        break;
    }
  }
}

extension UserRoleX on String {
  String localized(BuildContext context) {
    final l = S.of(context);

    switch (this) {
      case '0':
        return l.user;
      case '1':
        return l.worker;
      case '2':
        return l.merchant;
      case '3':
        return l.distributor;
      default:
        return 'Unknown';
    }
  }
}
