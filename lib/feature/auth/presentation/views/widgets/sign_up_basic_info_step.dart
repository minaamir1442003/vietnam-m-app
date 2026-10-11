import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constans.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/widget/custom_text_form_field.dart';
import '../../cubit/signup_view_model.dart';
import '../../cubit/signup_state.dart';

class SignUpBasicInfoStep extends StatefulWidget {
  const SignUpBasicInfoStep({super.key,required this.onNext});
final VoidCallback onNext;
  @override
  State<SignUpBasicInfoStep> createState() => _SignUpBasicInfoStepState();
}

class _SignUpBasicInfoStepState extends State<SignUpBasicInfoStep> {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    final tr = S.of(context);

    return BlocBuilder<SignUpViewModel, SignUpState>(
      buildWhen: (p, c) =>
      p.firstName != c.firstName ||
          p.lastName != c.lastName ||
          p.email != c.email ||
          p.password != c.password ||
          p.confirmPassword != c.confirmPassword ||
          p.phone != c.phone ||
          p.imagePath != c.imagePath,
      builder: (context, state) {
        final vm = context.read<SignUpViewModel>();

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.withOpacity(.5)
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: vm.pickImage,
                  child: CircleAvatar(
                    radius: 46,
                    backgroundColor: AppColors.primaryColor.withOpacity(.1),
                    backgroundImage: state.imagePath != null
                        ? FileImage(File(state.imagePath!))
                        : null,
                    child: state.imagePath == null
                        ? Icon(Icons.camera_alt, color: AppColors.primaryColor)
                        : null,
                  ),
                ),

                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: AppTextFormField(
                        hint: tr.firstName,
                        onChanged: vm.updateFirstName,
                        prefixIcon: Icon(Icons.text_increase_sharp),
                        borderColor: state.firstNameError != null
                            ? Colors.red
                            : state.isFirstNameValid
                            ? Colors.green
                            : Colors.white,
                        focusBorderColor: state.firstNameError != null
                            ? Colors.red
                            : state.isFirstNameValid
                            ? Colors.green
                            : AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppTextFormField(
                        hint: tr.lastName,
                        prefixIcon: Icon(Icons.text_increase_sharp),
                        onChanged: vm.updateLastName,
                        borderColor: state.lastNameError != null
                            ? Colors.red
                            : state.isLastNameValid
                            ? Colors.green
                            : Colors.white,
                        focusBorderColor: state.lastNameError != null
                            ? Colors.red
                            : state.isLastNameValid
                            ? Colors.green
                            : AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                AppTextFormField(
                  hint: tr.email,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(Icons.email),
                  onChanged: vm.updateEmail,
                  borderColor: state.emailError != null
                      ? Colors.red
                      : state.isEmailValid
                      ? Colors.green
                      : Colors.white,
                  focusBorderColor: state.emailError != null
                      ? Colors.red
                      : state.isEmailValid
                      ? Colors.green
                      : AppColors.primaryColor,
                ),

                const SizedBox(height: 16),
                AppTextFormField(
                  hint: tr.password,
                  obscureText: obscurePassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      obscurePassword = !obscurePassword;
                      setState(() {});
                    },
                    icon: obscurePassword
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                  onChanged: vm.updatePassword,
                  borderColor: state.passwordError != null
                      ? Colors.red
                      : state.isPasswordValid
                      ? Colors.green
                      : Colors.white,
                  focusBorderColor: state.passwordError != null
                      ? Colors.red
                      : state.isPasswordValid
                      ? Colors.green
                      : AppColors.primaryColor,
                ),

                const SizedBox(height: 16),
                AppTextFormField(
                  hint: tr.confirmPassword,
                  obscureText: obscureConfirmPassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      obscureConfirmPassword = !obscureConfirmPassword;
                      setState(() {});
                    },
                    icon: obscurePassword
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                  onChanged: vm.updateConfirmPassword,
                  borderColor:
                      state.confirmPassword.isNotEmpty &&
                          state.confirmPassword != state.password
                      ? Colors.red
                      : Colors.white,
                  focusBorderColor:
                      state.confirmPassword.isNotEmpty &&
                          state.confirmPassword != state.password
                      ? Colors.red
                      : AppColors.primaryColor,
                ),

                const SizedBox(height: 16),
                AppTextFormField(
                  hint: tr.phoneNumber,
                  keyboardType: TextInputType.phone,
                  onChanged: vm.updatePhone,
                  prefixIcon: Icon(Icons.phone),
                  borderColor: state.phoneError != null
                      ? Colors.red
                      : state.isPhoneValid
                      ? Colors.green
                      : AppColors.whiteColor,
                  focusBorderColor: state.phoneError != null
                      ? Colors.red
                      : state.isPhoneValid
                      ? Colors.green
                      : AppColors.primaryColor,
                ),

                const SizedBox(height: 32),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 250),
                  opacity: state.isFirstNameValid &&
                      state.isLastNameValid &&
                      state.isEmailValid &&
                      state.isPasswordValid &&
                      state.isPhoneValid
                      ? 1
                      : 0.4,
                  child: FadeInLeft(
                    animate: true,
                    curve: Curves.easeInBack,
                    duration: Duration(milliseconds: 200),
                    child: ElevatedButton(
                      onPressed: state.isFirstNameValid &&
                          state.isLastNameValid &&
                          state.isEmailValid &&
                          state.isPasswordValid &&
                          state.isPhoneValid
                          ? () {
                        FocusScope.of(context).unfocus();
                        widget.onNext();
                      }
                          : null,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(52),
                        foregroundColor: AppColors.whiteColor
                      ),
                      child: Text(tr.next),
                    ),
                  ),
                ),


                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }
}
