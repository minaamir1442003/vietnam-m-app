import 'package:bloc/bloc.dart';import 'package:injectable/injectable.dart';

import '../../../../core/utils/app_assets.dart';
import '../../domain/onboarding_entity.dart';
import 'change_onboarding_state.dart';

@injectable
class ChangeOnboardingViewModel extends Cubit<ChangeOnboardingState> {
  ChangeOnboardingViewModel() : super(ChangePageOnBoardingInitialState());

  bool isLast = false;
  final List<OnboardingEntity> boarding = [
    OnboardingEntity(
      image: ImageAssets.onBoarding1,
      title: '✨ Vietnam M مرحبًا بك في عالم',
      body:
      'وجهتك الأولى لأرقى حلول الإضاءة الحديثة\n'
          'حيث الجودة، الأناقة، والابتكار\n'
          'في مكان واحد',
    ),
    OnboardingEntity(
      image: ImageAssets.onBoarding2,
      title: '💡إضاءة عصرية بأسلوب يليق بك',
      body:
      'اكتشف أحدث ابتكارات الإضاءة الحديثة\n'
          'واستمتع بتجربة تسوق سهلة وسريعة\n'
          'مع عروض حصرية بانتظارك',
    ),
    OnboardingEntity(
      image: ImageAssets.onBoarding3,
      title: '✨اجعل منزلك يضيء بأناقة',
      body:
      'أضف لمسة خاصة لبيتك\n'
          'مع تشكيلة مميزة\n'
          'تناسب جميع الأذواق',
    ),
  ];
  int index = 0;
  void doIntent(ChangeOnboardingIntent intent) {
    switch (intent) {
      case ClickedChangeOnboardingIntent():
        _changePage(index);
        break;
    }
  }

  void _changePage(int index) {
    if (index == boarding.length - 1) {
      isLast = true;
    } else {
      isLast = false;
    }
    emit(ChangePageOnBoardingState());
  }
}

sealed class ChangeOnboardingIntent {}

class ClickedChangeOnboardingIntent extends ChangeOnboardingIntent {}
