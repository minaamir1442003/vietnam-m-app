import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/result.dart';
import '../../../../generated/l10n.dart';
import '../../../location/domain/entity/location_response_entity.dart';
import '../../../location/domain/use_cae/location_use_case.dart';
import '../../domain/entity/sign_up_request.dart';
import '../../domain/use_case/auth_use_case.dart';
import 'signup_state.dart';

@injectable
class SignUpViewModel extends Cubit<SignUpState> {
  final AuthUseCase _authUseCase;
  final LocationUseCase _locationUseCase;
  final ImagePicker _picker = ImagePicker();

  SignUpViewModel(
      this._authUseCase,
      this._locationUseCase,
      ) : super(const SignUpState());

  Future<void> loadLocations() async {
    final result = await _locationUseCase();

    switch (result) {
      case Success():
        emit(
          state.copyWith(
            governorates: result.data!,
          ),
        );
        break;

      case Error():
        emit(
          state.copyWith(
            errorMessage: result.message ?? 'Failed to load locations',
          ),
        );
        break;
    }
  }

  void selectGovernorate(GovernorateEntity governorate) {
    emit(
      state.copyWith(
        selectedGovernorate: governorate,
        selectedCity: null,
        selectedVillage: null,
      ),
    );
  }

  void selectCity(CityEntity city) {
    emit(
      state.copyWith(
        selectedCity: city,
        selectedVillage: null,
      ),
    );
  }

  void selectVillage(VillageEntity village) {
    emit(
      state.copyWith(
        selectedVillage: village,
      ),
    );
  }
  void selectUserType(UserType type) {
    emit(
      state.copyWith(
        userType: type,
      ),
    );
  }

  Future<void> pickImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(
        state.copyWith(
          imagePath: image.path,
        ),
      );
    }
  }

  void updateFirstName(String value) {
    final valid = value.trim().length >= 2;
    emit(
      state.copyWith(
        firstName: value,
        isFirstNameValid: valid,
        firstNameError: valid ? null : 'First name is too short',
      ),
    );
  }

  void updateLastName(String value) {
    final valid = value.trim().length >= 2;
    emit(
      state.copyWith(
        lastName: value,
        isLastNameValid: valid,
        lastNameError: valid ? null : 'Last name is too short',
      ),
    );
  }

  void updateEmail(String value) {
    final emailRegex =
    RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    final valid = emailRegex.hasMatch(value.trim());

    emit(
      state.copyWith(
        email: value,
        isEmailValid: valid,
        emailError: valid ? null : 'Invalid email',
      ),
    );
  }

  void updatePassword(String value) {
    final valid = value.length >= 8;
    emit(
      state.copyWith(
        password: value,
        isPasswordValid: valid,
        passwordError: valid ? null : 'Password too weak',
      ),
    );
  }
  void updatePhone(String value) {
    final phone = value.trim();
    final valid = RegExp(r'^(010|011|012|015)\d{8}$').hasMatch(phone);

    emit(
      state.copyWith(
        phone: phone,
        isPhoneValid: valid,
        phoneError: valid ? null : 'Invalid phone number like 01145879632',
      ),
    );
  }


  void updateConfirmPassword(String value) {
    emit(
      state.copyWith(
        confirmPassword: value,
      ),
    );
  }

  Future<void> signUp(BuildContext context) async {
    FocusScope.of(context).unfocus();

    if (!state.canSubmit) {
      emit(
        state.copyWith(
          errorMessage: S.of(context).previous
        ),
      );
      return;
    }

    if (state.password != state.confirmPassword) {
      emit(
        state.copyWith(
          errorMessage: S.of(context).confirmPassword,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
      ),
    );

    final request = SignUpRequest(
      firstName: state.firstName,
      lastName: state.lastName,
      email: state.email,
      password: state.password,
      passwordConfirmation: state.confirmPassword,
      phone: '+2${state.phone.trim()}',
      type: state.userType!,
      governorateId: state.selectedGovernorate!.id,
      cityId: state.selectedCity!.id,
      villageId: state.selectedVillage!.id,
      imagePath: state.imagePath,
    );

    final result = await _authUseCase.execute(request);

    switch (result) {
      case Success():
        emit(
          state.copyWith(
            isLoading: false,
            isSuccess: true,
            successData: result.data,
          ),
        );
        break;

      case Error():
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: result.message ?? 'Sign up failed',
          ),
        );
        break;
    }
  }
}
