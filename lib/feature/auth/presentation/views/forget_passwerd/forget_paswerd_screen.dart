import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:project_one/core/utils/app_colors.dart';
import 'package:project_one/core/utils/text_styles.dart';
import 'package:project_one/core/widget/app_header.dart';

import '../../../../../core/di/injectable_initializer.dart';
import '../../../../../core/routes/pages_route.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/constans.dart';
import '../../../../../core/widget/custom_validate.dart';
import '../../../../../generated/l10n.dart';
import '../../cubit/forget_password_cubit/forget_password_state.dart';
import '../../cubit/forget_password_cubit/forget_password_view_model.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ForgetPasswordViewModel>(),
      child: BlocListener<ForgetPasswordViewModel, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordError) {
            EasyLoading.showError(state.message);
          }

          if (state is ForgetPasswordSuccess) {
            Navigator.pushNamed(
              context,
              PagesRoute.verifyEmail,
              arguments: state.email,
            );
          }
        },
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(ImageAssets.bacground),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  AppHeader(title: S.of(context).forgetPassword, height: 0.18),
                  const ForgetPasswordBody(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<ForgetPasswordViewModel>();
    final tr = S.of(context);

    return Form(
      key: vm.formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Column(
          children: [
            const SizedBox(height: 32),

            Text(
              tr.forgetPassword,
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: 12),

            Text(tr.forgetPasswordDescription, textAlign: TextAlign.center),

            const SizedBox(height: 32),

            BlocBuilder<ForgetPasswordViewModel, ForgetPasswordState>(
              builder: (context, state) {
                final isLoading = state is ForgetPasswordLoading;

                return TextFormField(
                  controller: vm.emailController,
                  enabled: !isLoading,
                  validator: AppValidate.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: tr.email,
                    prefixIcon: const Icon(Icons.email),
                  ),
                );
              },
            ),

            const SizedBox(height: 32),

            BlocBuilder<ForgetPasswordViewModel, ForgetPasswordState>(
              builder: (context, state) {
                final isLoading = state is ForgetPasswordLoading;

                return ElevatedButton(
                  onPressed: isLoading ? null : vm.submit,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(52),
                  ),
                  child: isLoading
                      ? const SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          tr.confirm,
                          style: AppTextStyles.inter400_14.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
