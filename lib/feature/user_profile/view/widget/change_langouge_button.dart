import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/service/localization_service.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class ChangeLanguageButton extends StatelessWidget {
  const ChangeLanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = context.watch<LocaleProvider>();
    final isArabic = localeProvider.locale.languageCode == 'ar';

    return GestureDetector(
      onTap: () {
        localeProvider.changeLocale(
          Locale(isArabic ? 'en' : 'ar'),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: AppColors.primaryColor,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              child: Icon(
                Icons.language,
                key: ValueKey(isArabic),
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              isArabic ? 'English' : 'العربية',
              style: AppTextStyles.inter500_16.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
