import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/result.dart';
import '../../../../data/model/update_user_response_model.dart';
import '../../../../data/model/user_profile_response_model.dart';
import '../../../../data/repository/user_profile_repository.dart';
import 'update_profile_state.dart';

@injectable
class UpdateProfileViewModel extends Cubit<UpdateProfileState> {
  final UserProfileRepository _profileRepository;
  final ImagePicker _picker = ImagePicker();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  UpdateProfileViewModel(this._profileRepository)
      : super(const UpdateProfileState());

  void initWithUser(UserResponseModel user) {
    firstNameController.text = user.firstname ?? '';
    lastNameController.text = user.lastname ?? '';
    emailController.text = user.email ?? '';
    phoneController.text = user.phone ?? '';
  }

  bool get canSubmit =>
      firstNameController.text.trim().isNotEmpty &&
          lastNameController.text.trim().isNotEmpty &&
          emailController.text.trim().isNotEmpty &&
          phoneController.text.trim().isNotEmpty &&
          !state.isLoading;

  Future<void> pickImage() async {
    final image =
    await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(imagePath: image.path));
    }
  }

  Future<void> submit() async {
    if (!canSubmit) return;

    emit(state.copyWith(isLoading: true, errorMessage: null));

    final request = UpdateProfileRequestModel(
      firstname: firstNameController.text.trim(),
      lastname: lastNameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      image: state.imagePath != null
          ? File(state.imagePath!)
          : null,
    );

    final result =
    await _profileRepository.updateUserProfile(request);

    switch (result) {
      case Success():
        emit(state.copyWith(
          isLoading: false,
          isSuccess: true,
        ));

        break;

      case Error():
        emit(state.copyWith(
          isLoading: false,
          errorMessage: result.message,
        ));
        break;
    }
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
