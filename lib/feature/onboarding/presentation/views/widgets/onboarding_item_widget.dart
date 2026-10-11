import 'package:flutter/material.dart';

import '../../../../../core/utils/text_styles.dart';
import '../../../domain/onboarding_entity.dart';

class OnBoardingPageContent extends StatelessWidget {
  const OnBoardingPageContent({
    super.key,
    required this.onboardingEntity,
  });

  final OnboardingEntity onboardingEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .4,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Image.asset(
            onboardingEntity.image,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            onboardingEntity.title,
            textAlign: TextAlign.center,
            style: AppTextStyles.inter500_20.copyWith(
              color: Colors.white,
            ),
          ),
        ),

        const SizedBox(height: 12),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            onboardingEntity.body,
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.fade,
            style: AppTextStyles.inter400_14.copyWith(
              color: Colors.white.withOpacity(.8),
            ),
          ),
        ),
      ],
    );
  }
}
