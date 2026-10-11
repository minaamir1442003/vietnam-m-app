import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_one/core/routes/pages_route.dart';
import 'package:project_one/core/service/strings.dart';
import 'package:project_one/core/utils/app_colors.dart';
import 'package:project_one/core/utils/text_styles.dart';
import 'package:project_one/core/widget/app_header.dart';
import 'package:project_one/core/widget/custom_dialog.dart';
import 'package:project_one/feature/user_profile/view/widget/change_langouge_button.dart';
import '../../../core/utils/app_assets.dart';
import '../../../generated/l10n.dart';
import '../manager/user_profile_view_model.dart';
import '../manager/user_profile_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var tr = S.of(context);
    var vm = context.read<ProfileViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ProfileViewModel, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }

          if (state is ProfileError) {
            return DialogUtils.showMessage(
              context: context,
              message: state.message,
              negativeActionName: tr.cancel,
              postActionName: tr.retry,
              postAction: () {
                vm.getUserProfile();
              },
            );
          }
          if (state is LogoutErrorState) {
            return DialogUtils.showMessage(
              context: context,
              message: state.message,
              negativeActionName: tr.cancel,
              postActionName: tr.retry,
              postAction: () {
                vm.logout();
              },
            );
          }
          if (state is DeleteAccountErrorState) {
            return DialogUtils.showMessage(
              context: context,
              message: state.message,
              negativeActionName: tr.cancel,
              postActionName: tr.retry,
              postAction: () {
                vm.deleteAccount();
              },
            );
          }

          if (state is ProfileLoaded ||
              state is LogoutLoadingState ||
              state is DeleteAccountLoadingState) {
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
                child: FadeInRight(
                  duration: Duration(milliseconds: 400),
                  animate: true,
                  curve: Easing.emphasizedAccelerate,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppHeader(title: tr.profile, height: .22),
                          const SizedBox(height: 20),
                          CircleAvatar(
                            radius: 75,
                            backgroundColor: Colors.blue.withOpacity(.3),
                            child: CircleAvatar(
                              radius: 70,
                              backgroundImage: vm.userModel!.image != null
                                  ? NetworkImage(vm.userModel!.image!)
                                  : null,
                              child: vm.userModel!.image == null
                                  ? Icon(Icons.person_4_rounded, size: 40)
                                  : null,
                            ),
                          ),

                          SizedBox(height: 8),
                          Text(
                            "${normalizeWord(vm.userModel!.firstname!)} ${normalizeWord(vm.userModel!.lastname!)}",
                          ),
                          SizedBox(height: 8),
                          Text("${tr.id}:- ${vm.userModel!.id}"),
                          const SizedBox(height: 16),
                          _InfoTile(
                            title: tr.phoneNumber,
                            value: vm.userModel!.phone ?? '-',
                            isRtl: false,
                          ),
                          const SizedBox(height: 12),
                          _InfoTile(
                            title: tr.governorate,
                            value: vm.userModel!.state ?? '-',
                          ),
                          const SizedBox(height: 12),
                          _InfoTile(
                            title: tr.city,
                            value: vm.userModel!.city ?? '-',
                          ),
                          const SizedBox(height: 16),
                          ChangeLanguageButton(),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () async {
                              final updated = await Navigator.pushNamed(
                                context,
                                PagesRoute.updateProfile,
                                arguments: vm.userModel,
                              );

                              if (updated == true) {
                                vm.getUserProfile();
                              }
                            },
                            child: Text(
                              tr.updateProfile,
                              style: AppTextStyles.inter400_16,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.red,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                                side: BorderSide(color: Colors.red, width: 2),
                              ),
                            ),
                            onPressed: () async {
                              state is LogoutLoadingState
                                  ? null
                                  : await vm.logout();
                              Navigator.pushReplacementNamed(
                                context,
                                PagesRoute.signInScreen,
                              );
                            },
                            child: state is LogoutLoadingState
                                ? CircularProgressIndicator(
                                    color: AppColors.primaryColor,
                                    strokeWidth: 2,
                                  )
                                : Text(
                                    tr.logout,
                                    style: AppTextStyles.inter400_16,
                                  ),
                          ),
                          const SizedBox(height: 16),
                          TextButton(
                            onPressed: state is DeleteAccountLoadingState
                                ? null
                                : () {
                                    DialogUtils.showMessage(
                                      context: context,
                                      title: tr.deleteAccount,
                                      message: tr.confirmDeleteAccount,
                                      negativeActionName: tr.cancel,
                                      postActionName: tr.delete,
                                      postAction: () async {
                                        await vm.deleteAccount();
                                        if (context.mounted) {
                                          Navigator.pushReplacementNamed(
                                            context,
                                            PagesRoute.signInScreen,
                                          );
                                        }
                                      },
                                    );
                                  },
                            child: state is DeleteAccountLoadingState
                                ? CircularProgressIndicator(
                                    color: Colors.red,
                                    strokeWidth: 2,
                                  )
                                : Text(
                                    tr.deleteAccount,
                                    style: AppTextStyles.inter400_16.copyWith(
                                      color: Colors.red,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                          ),

                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String title;
  final String value;
  final bool isRtl;

  const _InfoTile({
    required this.title,
    required this.value,
    this.isRtl = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 13, color: Colors.black54),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
