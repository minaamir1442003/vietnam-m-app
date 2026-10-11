import 'package:flutter/material.dart';
import 'package:project_one/core/utils/app_colors.dart';
import 'package:project_one/core/utils/text_styles.dart';
import '../../../generated/l10n.dart';

void showExchangeResultDialog(
  BuildContext context, {
  required String message,
  int? remainingPoints,
}) {
  final tr = S.of(context);

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle_rounded,
              color: AppColors.greenColor,
              size: 64,
            ),
            const SizedBox(height: 12),
            Text(
              tr.success,
              style: AppTextStyles.inter700_20.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.inter400_14,
            ),
            if (remainingPoints != null) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      '${tr.remainingPoints}: $remainingPoints',
                      style: AppTextStyles.inter600_18.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: Text(tr.close),
              ),
            ),
          ],
        ),
      );
    },
  );
}
