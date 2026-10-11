import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one/core/service/shared_pref_helper.dart';
import 'package:project_one/core/utils/constant_manager.dart';
import 'package:project_one/feature/auth/domain/use_case/sign_in%20_use_case.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/common/result.dart';
import '../../../domain/entity/sign_in_request.dart';
import 'sign_in_state.dart';

@injectable
class SignInViewModel extends Cubit<SignInState> {
  final SignInUseCase _signInUseCase;

  SignInViewModel(this._signInUseCase)
      : super(const SignInState());
  void updateEmail(String value) {
    final email = value.trim();
    final valid = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(email);
    emit(
      state.copyWith(
        email: email,
        isEmailValid: valid,
        emailError: valid ? null : 'Invalid email address',
      ),
    );
  }

  void updatePassword(String value) {
    final valid = value.length >= 6;

    emit(
      state.copyWith(
        password: value,
        isPasswordValid: valid,
        passwordError: valid ? null : 'Password too short',
      ),
    );
  }
  void togglePasswordVisibility() {
    emit(
      state.copyWith(
        isPasswordHidden: !state.isPasswordHidden,
      ),
    );
  }
  Future<void> signIn(BuildContext context) async {
    if (!state.canSubmit) return;

    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
      ),
    );

    final request = SignInRequest(
      email: state.email,
      password: state.password,
    );

    final result = await _signInUseCase.execute(request);

    switch (result) {
      case Success():
      await  SharedPrefHelper.setSecureString(AppConstants.token, result.data?.token.toString()??"");
      String? token =
      await SharedPrefHelper.getSecureString(AppConstants.token);
      log(token??"");
        emit(
          state.copyWith(
            isLoading: false,
            isSuccess: true,
            successData: result.data,
          ),
        );
        log('Sign in success');
        break;

      case Error():
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: result.message ?? 'Sign in failed',
          ),
        );
        log('Sign in error: ${result.message}');
        break;
    }
  }
  Future<void>openCampanyWebsite()async{
    final uri=Uri.parse('https://adbrandagency.com');
    if(await canLaunchUrl(uri)){
      await launchUrl(uri,mode: LaunchMode.externalApplication);
    }else{
      log('Could not launch $uri');
     }
  }
}
