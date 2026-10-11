import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:project_one/core/utils/app_colors.dart';
import 'package:project_one/core/utils/text_styles.dart';

import 'package:project_one/feature/layout/presentation/manager/prize_cubit/prize_tab_view_model.dart';
import 'package:project_one/feature/user_profile/manager/user_profile_view_model.dart';

import '../../../../generated/l10n.dart';
import '../../../../data/model/home_tab_response_model.dart';

void showPrizeDialog(
  BuildContext context,
  PrizeResponseModel prize, {
  required PrizesViewModel prizesVm,
}) {
  final userPoints =
      int.tryParse(context.read<ProfileViewModel>().userModel?.points ?? '0') ??
      0;

  final prizePoints = prize.points ?? 0;
  final canRedeem = userPoints >= prizePoints;

  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) {
      return Dialog(
        insetPadding: const EdgeInsets.all(16),
        backgroundColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: 'prize_${prize.id}',
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: InteractiveViewer(
                      minScale: .06,
                      maxScale: 4,
                      child: CachedNetworkImage(
                        imageUrl: prize.image ?? '',
                        fit: BoxFit.cover,
                        placeholder: (_, __) => Container(
                          color: AppColors.greyColor.withOpacity(.1),
                          child: const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                        errorWidget: (_, __, ___) => Container(
                          color: AppColors.greyColor.withOpacity(.1),
                          child: const Icon(Icons.image_not_supported),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(prize.name ?? '', style: AppTextStyles.inter600_18),

                    const SizedBox(height: 8),
                    Text(
                      '$prizePoints pts',
                      style: AppTextStyles.inter500_14.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),

                    const SizedBox(height: 16),

                    SizedBox(
                      width: double.infinity,
                      height: 44,
                      child: ElevatedButton(
                        onPressed: canRedeem
                            ? () {
                                Navigator.pop(context);
                                prizesVm.exchangePrize(prize.id!.toInt());
                              }
                            : null,
                        child: Text(
                          canRedeem
                              ? S.of(context).redeem
                              : S.of(context).noEnoughPoints,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
