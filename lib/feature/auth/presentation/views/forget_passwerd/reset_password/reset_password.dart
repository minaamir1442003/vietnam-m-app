import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:project_one/core/di/injectable_initializer.dart';
import 'package:project_one/core/utils/app_assets.dart';
import 'package:project_one/core/widget/app_header.dart';

import '../../../../../../core/routes/pages_route.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/constans.dart';
import '../../../../../../core/utils/text_styles.dart';
import '../../../../../../core/widget/custom_text_form_field.dart';
import '../../../../../../generated/l10n.dart';
import '../../../cubit/reset_password_cubit/reset_password_state.dart';
import '../../../cubit/reset_password_cubit/reset_password_view_model.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final email = args['email'] as String;
    final otp = args['otp'] as String;
    final tr = S.of(context);

    return BlocProvider(
      create: (_) => getIt<ResetPasswordViewModel>(),
      child: BlocConsumer<ResetPasswordViewModel, ResetPasswordState>(
        listener: (context, state) {
          if (state.isSuccess) {
            EasyLoading.showSuccess(tr.passwordResetSuccessfully);
            Navigator.pushNamedAndRemoveUntil(
              context,
              PagesRoute.signInScreen,
              (_) => false,
            );
          }

          if (state.errorMessage != null) {
            EasyLoading.showError(state.errorMessage!);
          }
        },
        builder: (context, state) {
          final vm = context.read<ResetPasswordViewModel>();

          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            body: SafeArea(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage(ImageAssets.bacground),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppHeader(title: tr.resetPassword, height: 0.18),
                      const SizedBox(height: 24),
                      Text(tr.resetPassword, style: AppTextStyles.inter500_20),

                      const SizedBox(height: 8),
                      Text(
                        tr.enterNewPassword,
                        style: AppTextStyles.inter400_14.copyWith(
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 16),
                      AppTextFormField(
                        hint: tr.newPassword,
                        obscureText: state.isPasswordHidden,
                        onChanged: vm.updatePassword,
                        suffixIcon: IconButton(
                          icon: Icon(
                            state.isPasswordHidden
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.primaryColor,
                          ),
                          onPressed: vm.togglePasswordVisibility,
                        ),
                        borderColor: state.passwordError != null
                            ? Colors.red
                            : state.isPasswordValid
                            ? Colors.green
                            : Colors.grey,
                        focusBorderColor: state.passwordError != null
                            ? Colors.red
                            : state.isPasswordValid
                            ? Colors.green
                            : AppColors.primaryColor,
                      ),

                      const SizedBox(height: 16),
                      AppTextFormField(
                        hint: tr.confirmPassword,
                        obscureText: state.isConfirmPasswordHidden,
                        onChanged: vm.updateConfirmPassword,
                        suffixIcon: IconButton(
                          icon: Icon(
                            state.isConfirmPasswordHidden
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.primaryColor,
                          ),
                          onPressed: vm.toggleConfirmPasswordVisibility,
                        ),
                        borderColor: state.confirmPasswordError != null
                            ? Colors.red
                            : state.isConfirmPasswordValid
                            ? Colors.green
                            : Colors.grey,
                        focusBorderColor: state.confirmPasswordError != null
                            ? Colors.red
                            : state.isConfirmPasswordValid
                            ? Colors.green
                            : AppColors.primaryColor,
                      ),

                      const SizedBox(height: 40),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 250),
                        opacity: state.canSubmit ? 1 : 0.4,
                        child: ElevatedButton(
                          onPressed: state.canSubmit
                              ? () {
                                  FocusScope.of(context).unfocus();
                                  vm.resetPassword(email: email, otp: otp);
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(52),
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: state.isLoading
                              ? const SizedBox(
                                  height: 22,
                                  width: 22,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  tr.resetPassword,
                                  style: AppTextStyles.inter500_16.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
