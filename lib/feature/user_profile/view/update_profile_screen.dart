import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:project_one/core/di/injectable_initializer.dart';
import 'package:project_one/core/utils/app_assets.dart';
import 'package:project_one/core/widget/app_header.dart';
import 'package:project_one/core/widget/custom_validate.dart';
import 'package:project_one/data/model/user_profile_response_model.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/constans.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widget/custom_text_form_field.dart';
import '../../../../generated/l10n.dart';
import '../manager/update_profile_cubit/update_profile_state.dart';
import '../manager/update_profile_cubit/update_profile_view_model.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = S.of(context);
    final user =
        ModalRoute.of(context)!.settings.arguments as UserResponseModel;

    return BlocProvider(
      create: (_) => getIt.get<UpdateProfileViewModel>()..initWithUser(user),
      child: Builder(
        builder: (context) {
          final vm = context.read<UpdateProfileViewModel>();

          return Form(
            key: vm.formKey,
            child: Scaffold(
              body: BlocConsumer<UpdateProfileViewModel, UpdateProfileState>(
                listener: (context, state) {
                  if (state.isLoading) {
                    EasyLoading.show();
                  }

                  if (state.isSuccess) {
                    EasyLoading.dismiss();
                    Navigator.pop(context, true);
                    EasyLoading.showSuccess(
                      tr.datHasBeenUpdatedSuccessfully,
                      duration: const Duration(milliseconds: 1500),
                    );
                  }

                  if (state.errorMessage != null) {
                    EasyLoading.dismiss();
                    EasyLoading.showError(state.errorMessage!);
                  }
                },
                builder: (context, state) {
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(ImageAssets.bacground),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: kHorizontalPadding,
                      ),
                      child: SafeArea(
                        child: Column(
                          children: [
                            AppHeader(title: tr.updateProfile, height:.1),
                            const SizedBox(height: 32),
                            Center(
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  CircleAvatar(
                                    radius: 70,
                                    backgroundColor: AppColors.greyColor,
                                    backgroundImage: state.imagePath != null
                                        ? FileImage(File(state.imagePath!))
                                        : user.image != null
                                        ? NetworkImage(user.image!)
                                        : null,
                                    child:
                                        state.imagePath == null &&
                                            user.image == null
                                        ? const Icon(Icons.person, size: 50)
                                        : null,
                                  ),
                                  IconButton(
                                    onPressed: vm.pickImage,
                                    icon: const CircleAvatar(
                                      radius: 20,
                                      backgroundColor: AppColors.primaryColor,
                                      child: Icon(
                                        Icons.camera_alt,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        
                            const SizedBox(height: 32),
                            AppTextFormField(
                              hint: tr.firstName,
                              controller: vm.firstNameController,
                              borderColor: AppColors.greyColor,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "first Name Required";
                                }
                                if (value.trim().length < 2) {
                                  return "first Name Too Short";
                                }
                                return null;
                              },
                            ),
                        
                            const SizedBox(height: 16),
                            AppTextFormField(
                              hint: tr.lastName,
                        
                              controller: vm.lastNameController,
                              borderColor: AppColors.greyColor,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "last Name Required";
                                }
                                if (value.trim().length < 2) {
                                  return "last Name Too Short";
                                }
                                return null;
                              },
                            ),
                        
                            const SizedBox(height: 16),
                            AppTextFormField(
                              hint: tr.email,
                              controller: vm.emailController,
                              keyboardType: TextInputType.emailAddress,
                              borderColor: AppColors.greyColor,
                              validator: AppValidate.validateEmail,
                            ),
                        
                            const SizedBox(height: 16),
                            AppTextFormField(
                              hint: tr.phoneNumber,
                              controller: vm.phoneController,
                              keyboardType: TextInputType.phone,
                              borderColor: AppColors.greyColor,
                              validator: AppValidate.validateMobile,
                            ),
                        
                            const SizedBox(height: 32),
                            AnimatedOpacity(
                              duration: const Duration(milliseconds: 250),
                              opacity: vm.canSubmit ? 1 : 0.4,
                              child: ElevatedButton(
                                onPressed: vm.canSubmit
                                    ? () {
                                        if (vm.formKey.currentState!.validate()) {
                                          FocusScope.of(context).unfocus();
                                          vm.submit();
                                        }
                                      }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(52),
                                  backgroundColor: AppColors.primaryColor,
                                ),
                                child: Text(
                                  tr.saveChanges,
                                  style: AppTextStyles.inter500_16.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                        
                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
