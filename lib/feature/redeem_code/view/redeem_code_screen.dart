import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:project_one/core/widget/app_header.dart';

import '../../../../core/di/injectable_initializer.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/constans.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widget/custom_text_form_field.dart';
import '../../../core/utils/app_assets.dart';
import '../../../generated/l10n.dart';
import '../../user_profile/manager/user_profile_view_model.dart';
import '../manager/redeem_code_state.dart';
import '../manager/redeem_code_view_model.dart';

class RedeemCodeScreen extends StatelessWidget {
  const RedeemCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = S.of(context);

    return BlocProvider(
      create: (_) => getIt<RedeemCodeCubit>(),
      child: BlocConsumer<RedeemCodeCubit, RedeemCodeState>(
        listener: (context, state) async {
          if (state.isSuccess) {
            EasyLoading.showSuccess(
              '+${state.pointsAdded} ${tr.points} 🎉',
            );
            await context.read<ProfileViewModel>().getUserProfile();
          }

          if (state.errorMessage != null) {
            EasyLoading.showError(
              state.errorMessage!,
              duration: const Duration(seconds: 1),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<RedeemCodeCubit>();

          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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

                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: kHorizontalPadding,
                  ),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppHeader(title: tr.redeemCode, height: .17),
                        SizedBox(height: 32),
                        Container(
                          height: 260,
                          margin: const EdgeInsets.only(bottom: 24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 2,
                            ),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: MobileScanner(
                                  controller: MobileScannerController(
                                    detectionSpeed: DetectionSpeed.noDuplicates,
                                  ),
                                  onDetect: (capture) {
                                    final code =
                                        capture.barcodes.first.rawValue;
                                    if (code != null) {
                                      cubit.onQrScanned(code);
                                    }
                                  },
                                ),
                              ),
                              Container(
                                width: 180,
                                height: 180,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Text(
                          tr.enterRedeemCode,
                          style: AppTextStyles.inter500_20,
                        ),

                        const SizedBox(height: 12),

                        AppTextFormField(
                          hint: tr.enterCode,
                          controller: cubit.codeController,
                          onChanged: cubit.onCodeChanged,
                          isEnabled: !state.isLoading,
                          borderColor: AppColors.greyColor,
                          focusBorderColor: AppColors.primaryColor,
                        ),

                        const SizedBox(height: 24),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 250),
                          opacity: state.canRedeem ? 1 : 0.4,
                          child: ElevatedButton(
                            onPressed:
                            state.canRedeem ? cubit.redeem : null,
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(52),
                              backgroundColor: AppColors.primaryColor,
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
                              tr.redeem,
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
            ),
          );
        },
      ),
    );
  }
}
