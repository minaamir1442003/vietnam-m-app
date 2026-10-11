import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_one/core/utils/app_assets.dart';
import 'package:project_one/core/utils/app_colors.dart';
import 'package:project_one/core/utils/text_styles.dart';
import 'package:project_one/core/widget/app_header.dart';
import 'package:project_one/core/widget/custom_dialog.dart';
import 'package:project_one/core/widget/exchange_result_dialog.dart';
import 'package:project_one/feature/layout/presentation/manager/prize_cubit/prize_tab_state.dart';
import 'package:project_one/feature/layout/presentation/manager/prize_cubit/prize_tab_view_model.dart';
import 'package:project_one/feature/layout/presentation/widgets/custom_header_layout.dart';
import 'package:project_one/feature/layout/presentation/widgets/custom_prize_card.dart';
import 'package:project_one/feature/layout/presentation/widgets/show_prize_dialog.dart';
import 'package:project_one/feature/user_profile/manager/user_profile_view_model.dart';

import '../../../../generated/l10n.dart';
import '../../../user_profile/manager/user_profile_state.dart';

class PrizeScreen extends StatelessWidget {
  final PrizesViewModel viewModel;

  const PrizeScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final tr = S.of(context);
    final prizesVm = viewModel;

    return BlocConsumer<PrizesViewModel, PrizesState>(
      bloc: prizesVm,
      listener: (context, state) {
        if (state is PrizesError) {
          DialogUtils.showMessage(
            context: context,
            message: state.message,
            title: tr.error,
            negativeActionName: tr.cancel,
            postActionName: tr.retry,
            postAction: prizesVm.loadPrizes,
          );
        }

        if (state is PrizeExchangeError) {
          DialogUtils.showMessage(
            context: context,
            message: state.message,
            title: tr.error,
            negativeActionName: tr.cancel,
          );
        }

        if (state is PrizeExchangeSuccess) {
          context.read<ProfileViewModel>().getUserProfile();

          showExchangeResultDialog(
            context,
            message: state.message,
            remainingPoints: state.remainingPoints,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(ImageAssets.bacground, fit: BoxFit.cover),
              ),
              Column(
                children: [
                  const _PrizeHeader(),

                  const SizedBox(height: 16),
                  if (state is PrizesLoading)
                    const CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    )
                  else if (prizesVm.prizes.isNotEmpty)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: GridView.builder(
                          physics: const ClampingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                childAspectRatio: 0.7,
                              ),
                          itemCount: prizesVm.prizes.length,
                          itemBuilder: (context, index) {
                            final prize = prizesVm.prizes[index];

                            return InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                showPrizeDialog(
                                  context,
                                  prize,
                                  prizesVm: prizesVm,
                                );
                              },
                              child: Hero(
                                tag: 'prize_${prize.id}',
                                child: CustomPrizeCard(
                                  prize: prize,
                                  showButton: true,
                                  button: ElevatedButton(
                                    onPressed: () {
                                      showPrizeDialog(
                                        context,
                                        prize,
                                        prizesVm: prizesVm,
                                      );
                                    },
                                    child: Text(
                                      tr.redeem,
                                      style: AppTextStyles.inter400_16,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: Center(
                        child: Text(
                          tr.noPrizesFoundNow,
                          style: AppTextStyles.inter600_18,
                        ),
                      ),
                    ),

                  const SizedBox(height: 16),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PrizeHeader extends StatelessWidget {
  const _PrizeHeader();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileViewModel, ProfileState>(
      builder: (context, state) {
        final user = context.read<ProfileViewModel>().userModel;

        if (user == null) {
          return const SizedBox(height: 140);
        }

        return CustomHeaderLayout(
          onTap: () {
            Navigator.pop(context);
          },
          avatarWidget: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          name: user.firstname ?? "",
          image: user.image ?? "",
          role: user.minRole?.localized(context) ?? "",
          points: user.points ?? "0",
        );
      },
    );
  }
}
