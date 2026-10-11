import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_one/feature/onboarding/presentation/views/widgets/onboarding_item_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/di/injectable_initializer.dart';
import '../../../../core/routes/pages_route.dart';
import '../../../../core/service/shared_pref_helper.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/constant_manager.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../generated/l10n.dart';
import '../../domain/onboarding_entity.dart';
import '../cubits/change_onboarding_state.dart';
import '../cubits/change_onboarding_view_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _pageController;
  late final ChangeOnboardingViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _viewModel = getIt<ChangeOnboardingViewModel>();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _finishOnboarding(BuildContext context) {
    SharedPrefHelper.setData(AppConstants.onBoarding, true);
    Navigator.pushNamedAndRemoveUntil(
      context,
      PagesRoute.signInScreen,
      (_) => false,
    );
  }


  @override
  Widget build(BuildContext context) {
    final tr = S.of(context);

    return BlocProvider(
      create: (_) => _viewModel,
      child: WillPopScope(
        onWillPop:()async {
          SystemNavigator.pop();
          return false;
        } ,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: BlocBuilder<ChangeOnboardingViewModel, ChangeOnboardingState>(
              builder: (context, state) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageAssets.bacground),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () => _finishOnboarding(context),
                          child: Text(
                            tr.skip,
                            style: AppTextStyles.inter400_14.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          physics: const BouncingScrollPhysics(),
                          itemCount: _viewModel.boarding.length,
                          onPageChanged: (index) {
                            _viewModel.index = index;
                            _viewModel.doIntent(ClickedChangeOnboardingIntent());
                          },
                          itemBuilder: (context, index) {
                            return OnBoardingPageContent(
                              onboardingEntity: _viewModel.boarding[index],
                            );
                          },
                        ),
                      ),
                      if (_viewModel.index == 2)
                        Card(
                          elevation: 5,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () => _finishOnboarding(context),
                            child: Container(
                              width: 120,
                              height: 50,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white24,
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                  width: 2,
                                ),
                              ),
                              child: Text(
                                "تسوق الان",
                                textAlign: TextAlign.center,
                                style: AppTextStyles.inter600_18.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(height: 24),
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: _viewModel.boarding.length,
                        effect: ExpandingDotsEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          spacing: 6,
                          dotColor: Colors.white.withOpacity(.4),
                          activeDotColor: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: SizedBox(
                          height: 52,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              if (_viewModel.index ==
                                  _viewModel.boarding.length - 1) {
                                _finishOnboarding(context);
                              } else {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            child: Text(
                              _viewModel.index == _viewModel.boarding.length - 1
                                  ? tr.confirm
                                  : tr.next,
                              style: AppTextStyles.inter500_16.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
