import '../../../location/domain/entity/location_response_entity.dart';
import '../../domain/entity/sign_up_response_entity.dart';
import '../../domain/entity/sign_up_request.dart';

class SignUpState {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;

  final UserType? userType;

  final List<GovernorateEntity> governorates;
  final GovernorateEntity? selectedGovernorate;
  final CityEntity? selectedCity;
  final VillageEntity? selectedVillage;

  final String? imagePath;

  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;
  final SignUpResponseEntity? successData;

  final bool isFirstNameValid;
  final bool isLastNameValid;
  final bool isEmailValid;
  final bool isPasswordValid;

  final String? firstNameError;
  final String? lastNameError;
  final String? emailError;
  final String? passwordError;
  final bool isPhoneValid;
  final String? phoneError;

  const SignUpState({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.phone = '',
    this.userType,
    this.governorates = const [],
    this.selectedGovernorate,
    this.selectedCity,
    this.selectedVillage,
    this.imagePath,
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.successData,
    this.isFirstNameValid = false,
    this.isLastNameValid = false,
    this.isEmailValid = false,
    this.isPasswordValid = false,
    this.firstNameError,
    this.lastNameError,
    this.emailError,
    this.passwordError,
    this.isPhoneValid=false,
    this.phoneError
  });

  bool get canSubmit =>
      userType != null &&
          selectedGovernorate != null &&
          selectedCity != null &&
          selectedVillage != null &&
          isFirstNameValid &&
          isLastNameValid &&
          isEmailValid &&
          isPhoneValid&&
          isPasswordValid &&
          !isLoading;

  SignUpState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? confirmPassword,
    String? phone,
    UserType? userType,
    List<GovernorateEntity>? governorates,
    GovernorateEntity? selectedGovernorate,
    CityEntity? selectedCity,
    VillageEntity? selectedVillage,
    String? imagePath,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    SignUpResponseEntity? successData,
    bool? isFirstNameValid,
    bool? isLastNameValid,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool?isPhoneValid,
    String? firstNameError,
    String? lastNameError,
    String? emailError,
    String? passwordError,
    final String? phoneError,
  }) {
    return SignUpState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      phone: phone ?? this.phone,
      userType: userType ?? this.userType,
      governorates: governorates ?? this.governorates,
      selectedGovernorate:
      selectedGovernorate ?? this.selectedGovernorate,
      selectedCity: selectedCity ?? this.selectedCity,
      selectedVillage: selectedVillage ?? this.selectedVillage,
      imagePath: imagePath ?? this.imagePath,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
      successData: successData ?? this.successData,
      isFirstNameValid: isFirstNameValid ?? this.isFirstNameValid,
      isLastNameValid: isLastNameValid ?? this.isLastNameValid,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isPhoneValid: isPhoneValid?? this.isPhoneValid,
      firstNameError: firstNameError,
      lastNameError: lastNameError,
      emailError: emailError,
      passwordError: passwordError,
      phoneError: phoneError
    );
  }
}
