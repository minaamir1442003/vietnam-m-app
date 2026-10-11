import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../../core/routes/pages_route.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/constans.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widget/custom_text_form_field.dart';
import '../../../../../generated/l10n.dart';
import '../../cubit/sign_in_cubit/sign_in_view_model.dart';
import '../../cubit/sign_in_cubit/sign_in_state.dart';
import 'no_have_account_widget.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = S.of(context);

    return BlocConsumer<SignInViewModel, SignInState>(
      listener: (context, state) async {
        if (state.isLoading) {
          EasyLoading.show();
        }
        if (state.isSuccess) {
          EasyLoading.dismiss();
          Navigator.pushNamedAndRemoveUntil(
            context,
            PagesRoute.layOutScreen,
            (route) => false,
          );
        }
        if (state.errorMessage != null) {
          EasyLoading.dismiss();
          EasyLoading.showError(state.errorMessage!);
        }
      },
      builder: (context, state) {
        final vm = context.read<SignInViewModel>();

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),

                Text(tr.signIn, style: AppTextStyles.inter500_20),
                SizedBox(height: 8),
                Text(tr.heyThere, style: AppTextStyles.inter400_16),
                Text(tr.welcomeBack, style: AppTextStyles.inter500_20),

                const SizedBox(height: 24),

                Center(
                  child: CircleAvatar(
                    radius: 90,
                    backgroundColor: AppColors.whiteColor,
                    backgroundImage: AssetImage(IconAssets.loginIcon),
                  ),
                ),

                const SizedBox(height: 32),
                AppTextFormField(
                  hint: tr.email,
                  prefixIcon: const Icon(Icons.email),
                  onChanged: vm.updateEmail,
                  borderColor: state.emailError != null
                      ? Colors.red
                      : state.isEmailValid
                      ? Colors.green
                      : Colors.grey,
                  focusBorderColor: state.emailError != null
                      ? Colors.red
                      : state.isEmailValid
                      ? Colors.green
                      : AppColors.primaryColor,
                ),

                const SizedBox(height: 16),
                AppTextFormField(
                  hint: tr.password,
                  obscureText: state.isPasswordHidden,
                  onChanged: vm.updatePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      state.isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
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

                const SizedBox(height: 4),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, PagesRoute.forgetPassword);
                    },
                    child: Text(tr.forgetPassword),
                  ),
                ),

                const SizedBox(height: 24),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 250),
                  opacity: state.canSubmit ? 1 : 0.4,
                  child: ElevatedButton(
                    onPressed: state.canSubmit
                        ? () {
                            FocusScope.of(context).unfocus();
                            vm.signIn(context);
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(52),
                      backgroundColor: AppColors.primaryColor,
                    ),
                    child: Text(
                      tr.login,
                      style: AppTextStyles.inter500_16.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                const NoHaveAccountWidget(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      tr.poweredBy,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.inter400_14.copyWith(
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(width: 2),
                    GestureDetector(
                      onTap: () {
                        vm.openCampanyWebsite();
                      },
                      child: Text(
                        "Ad Brand Agency",
                        style: AppTextStyles.inter500_16.copyWith(
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColor,
                        ),
                      ),
                    ),

                  ],
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
