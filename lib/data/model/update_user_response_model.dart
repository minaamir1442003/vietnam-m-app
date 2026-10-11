import 'dart:io';

import 'package:project_one/data/model/user_profile_response_model.dart';
import 'package:dio/dio.dart';

class UpdateProfileResponseModel {
  final bool status;
  final String message;
  final UserResponseModel data;

  UpdateProfileResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UpdateProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponseModel(
      status: json['status'],
      message: json['message'],
      data: UserResponseModel.fromJson(json['data']),
    );
  }
}

class UpdateProfileRequestModel {
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phone;
  final File? image;

  UpdateProfileRequestModel({
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.image,
  });

  Future<FormData> toFormData() async {
    final Map<String, dynamic> data = {};

    if (firstname != null) data['firstname'] = firstname;
    if (lastname != null) data['lastname'] = lastname;
    if (email != null) data['email'] = email;
    if (phone != null) data['phone'] = phone;

    if (image != null) {
      data['image'] = await MultipartFile.fromFile(
        image!.path,
        filename: image!.path.split('/').last,
      );
    }

    return FormData.fromMap(data);
  }
}
