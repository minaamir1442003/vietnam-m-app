import 'package:flutter/material.dart';

enum UserType { user, worker, merchant, distributor }

extension UserTypeX on UserType {
  int get value {
    switch (this) {
      case UserType.user:
        return 0;
      case UserType.worker:
        return 1;
      case UserType.merchant:
        return 2;
      case UserType.distributor:
        return 3;
    }
  }
}

extension UserTypeUi on UserType {
  IconData icon() {
    switch (this) {
      case UserType.user:
        return Icons.person_outline;
      case UserType.worker:
        return Icons.personal_injury_outlined;
      case UserType.merchant:
        return Icons.medical_information_rounded;
      case UserType.distributor:
        return Icons.vertical_distribute_rounded;
    }
  }
}

class SignUpRequest  {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String passwordConfirmation;
  final String phone;
  final int governorateId;
  final int cityId;
  final int villageId;
  final UserType type;
  final String? imagePath;

  const SignUpRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.phone,
     required this.governorateId,
     required this.cityId,
     required this.villageId,
    required this.type,
    this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstname': firstName,
      'lastname': lastName,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'phone': phone,
      'governorate_id': governorateId,
      'city_id': cityId,
      'village_id': villageId,
      'type': type.value,
      'imagePath': imagePath,
    };
  }

}
