import 'package:flutter/material.dart';
import 'package:project_one/core/utils/app_colors.dart';

import '../../../../core/utils/text_styles.dart';
import '../../../../data/model/wallet_tab_response_model.dart';

class CustomTransactionItem extends StatelessWidget {
  final WalletTransactionModel tx;

  const CustomTransactionItem({super.key, required this.tx});

  @override
  Widget build(BuildContext context) {
    final isEarn = tx.type == 'earn';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: isEarn
                ? AppColors.primaryColor.withOpacity(.2)
                : Colors.red.shade100,
            child: Icon(
              isEarn ? Icons.add : Icons.remove,
              color: isEarn ? AppColors.primaryColor : Colors.red,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tx.description, style: AppTextStyles.inter500_14),
                const SizedBox(height: 4),
                Text(
                  tx.date,
                  style: AppTextStyles.inter400_12.copyWith(color:AppColors.primaryColor),
                ),
              ],
            ),
          ),
          Text(
            '${isEarn ? '+' : '-'}${tx.points}',
            style: AppTextStyles.inter600_18.copyWith(
              color: isEarn ? AppColors.primaryColor : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
