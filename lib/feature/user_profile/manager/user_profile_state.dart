import 'package:project_one/data/model/user_profile_response_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserResponseModel user;

  ProfileLoaded(this.user);
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}

class LogoutLoadingState extends ProfileState {}

class LogoutErrorState extends ProfileState {
  final String message;

  LogoutErrorState(this.message);
}

class LogoutSuccessState extends ProfileState {}

class DeleteAccountLoadingState extends ProfileState {}

class DeleteAccountErrorState extends ProfileState {
  final String message;

  DeleteAccountErrorState(this.message);
}

class DeleteAccountSuccessState extends ProfileState {}
class ProfilePointsUpdated extends ProfileState {
  final num points;

  ProfilePointsUpdated(this.points);
}
