import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:project_one/core/service/shared_pref_helper.dart';
import 'package:project_one/core/utils/app_assets.dart';
import 'package:project_one/core/utils/constant_manager.dart';

import '../../../../core/di/injectable_initializer.dart';
import '../../../../core/routes/pages_route.dart';
import '../../../../generated/l10n.dart';
import '../../../user_profile/manager/user_profile_view_model.dart';
import '../cubit/signup_state.dart';
import '../cubit/signup_view_model.dart';
import 'widgets/sign_up_stepper_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpViewModel>(
      create: (_) {
        final vm = getIt<SignUpViewModel>();
        vm.loadLocations();
        return vm;
      },
      child: BlocListener<SignUpViewModel, SignUpState>(
        listener: (context, state) async {
          if (state.isLoading) {
            EasyLoading.show();
            return;
          }

          EasyLoading.dismiss();

          if (state.isSuccess) {
            Navigator.pushReplacementNamed(context, PagesRoute.layOutScreen);
            log(
              "token : ${SharedPrefHelper.getSecureString(AppConstants.token)}",
            );
            // await context.read<ProfileViewModel>().getUserProfile();
          }

          if (state.errorMessage != null) {
            EasyLoading.showError(state.errorMessage!);
          }
        },
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(ImageAssets.bacground),
                fit: BoxFit.fill,
              ),
            ),
            child: const SignUpStepperBody(),
          ),
        ),
      ),
    );
  }
}
