import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_one/core/utils/text_styles.dart';
import 'package:project_one/core/widget/custom_dialog.dart';
import 'package:project_one/core/widget/exchange_result_dialog.dart';
import 'package:project_one/feature/layout/presentation/manager/prize_cubit/prize_tab_state.dart';
import 'package:project_one/feature/layout/presentation/widgets/custom_ads_slider.dart';
import 'package:project_one/feature/layout/presentation/widgets/custom_header_layout.dart';
import 'package:project_one/feature/layout/presentation/widgets/custom_prize_list.dart';
import 'package:project_one/feature/layout/presentation/widgets/show_prize_dialog.dart';
import 'package:project_one/feature/user_profile/manager/user_profile_view_model.dart';
import 'package:project_one/feature/user_profile/manager/user_profile_state.dart';

import '../../../../core/routes/pages_route.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../generated/l10n.dart';
import '../manager/home_cubit/home_tab_state.dart';
import '../manager/home_cubit/home_tab_view_model.dart';
import '../manager/prize_cubit/prize_tab_view_model.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final prizesVm = context.read<PrizesViewModel>();
    final tr = S.of(context);

    return BlocListener<PrizesViewModel, PrizesState>(
      bloc: prizesVm,
      listener: (context, state) {
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
      child: BlocBuilder<ProfileViewModel, ProfileState>(
        builder: (context, profileState) {
          final profileVm = context.read<ProfileViewModel>();

          return BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is HomeError) {
                return Center(child: Text(state.message));
              }

              if (state is HomeLoaded) {
                final cubit = context.read<HomeCubit>();

                return Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        ImageAssets.bacground,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CustomHeaderLayout(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  PagesRoute.profile,
                                );
                              },
                              isShown: true,
                              avatarWidget: CircleAvatar(
                                radius: 35,
                                backgroundColor: Colors.blue.withOpacity(.3),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      profileVm.userModel?.image != null
                                      ? NetworkImage(
                                          profileVm.userModel!.image!,
                                        )
                                      : null,
                                  child: profileVm.userModel?.image == null
                                      ? Icon(Icons.person_4_rounded, size: 40)
                                      : null,
                                ),
                              ),
                              name: profileVm.userModel?.firstname ?? "",
                              image: profileVm.userModel?.image ?? "",
                              role:
                                  profileVm.userModel?.minRole?.localized(
                                    context,
                                  ) ??
                                  '',
                              points:
                                  profileVm.userModel?.points?.toString() ??
                                  "0",
                            ),
                            Positioned(
                              bottom: -80,
                              left: 0,
                              right: 0,
                              child: HomeAdsSlider(ads: cubit.ads),
                            ),
                          ],
                        ),

                        const SizedBox(height: 140),
                        cubit.prizes.isNotEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        PagesRoute.prizeScreen,
                                        arguments: context
                                            .read<PrizesViewModel>(),
                                      );
                                    },
                                    child: Text(S.of(context).viewAll),
                                  ),
                                  CustomPrizeList(
                                    prize: cubit.prizes,
                                    onRedeem: (prize) {
                                      showPrizeDialog(
                                        context,
                                        prize,
                                        prizesVm: context
                                            .read<PrizesViewModel>(),
                                      );
                                    },
                                  ),
                                ],
                              )
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 120,
                                ),
                                child: Center(
                                  child: Text(
                                    S.of(context).noPrizesFoundNow,
                                    style: AppTextStyles.inter600_18,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ],
                );
              }

              return const SizedBox();
            },
          );
        },
      ),
    );
  }
}
