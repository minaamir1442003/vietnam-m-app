import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:project_one/core/routes/pages_route.dart';
import 'package:project_one/core/utils/app_assets.dart';
import 'package:project_one/core/utils/app_colors.dart';
import 'package:project_one/core/utils/text_styles.dart';
import 'package:project_one/core/widget/app_header.dart';

import '../../../../../../core/di/injectable_initializer.dart';
import '../../../../../../generated/l10n.dart';
import '../../../cubit/verfy_code/verify_code_state.dart';
import '../../../cubit/verfy_code/verify_code_view_model.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as String? ?? '';
    return BlocProvider(
      create: (_) => getIt<VerifyOtpViewModel>(),
      child: BlocListener<VerifyOtpViewModel, VerifyOtpState>(
        listener: (context, state) {
          final vm = context.read<VerifyOtpViewModel>();
          if (state is VerifyOtpError) {
            EasyLoading.showError(state.message);
          }
          if (state is VerifyOtpSuccess) {
            Navigator.pushNamed(
              context,
              PagesRoute.resetPassword,
              arguments: {'email': email, 'otp': vm.otpController.text},
            );
          }
        },
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageAssets.bacground),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  AppHeader(title: S.of(context).verify, height: 0.28),
                  SizedBox(height: 16),
                  VerifyOtpBody(email: email),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class VerifyOtpBody extends StatelessWidget {
  final String email;

  const VerifyOtpBody({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<VerifyOtpViewModel>();
    var tr = S.of(context);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),

          Text(
            tr.enterTheDigitCodeSentToYourEmail,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 32),

          PinCodeTextField(
            appContext: context,
            length: 6,
            controller: vm.otpController,
            keyboardType: TextInputType.number,
            autoFocus: true,
            animationType: AnimationType.scale,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(8),
              fieldHeight: 50,
              fieldWidth: 45,
              activeColor: AppColors.primaryColor,
              selectedColor: Colors.blueAccent,
              activeFillColor: Colors.green.withOpacity(.5),
              errorBorderColor: Colors.red,
              inactiveColor: Colors.grey,
            ),
            onChanged: (_) {},
          ),

          const SizedBox(height: 32),

          BlocBuilder<VerifyOtpViewModel, VerifyOtpState>(
            builder: (context, state) {
              final isLoading = state is VerifyOtpLoading;

              return ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () {
                        vm.submit(email: email);
                      },
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
                        tr.verify,
                        style: AppTextStyles.inter500_18.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
