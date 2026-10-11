import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../generated/l10n.dart';

class WalletHeader extends StatelessWidget {
  final String balance;

  const WalletHeader({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor,
            AppColors.primaryColor.withOpacity(.8),
          ],
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.account_balance_wallet,
              size: 40, color: Colors.white),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                S.of(context).walletBalance,
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 4),
              Text(
                '$balance Points',
                style: AppTextStyles.inter700_20.copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
