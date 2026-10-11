import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_one/core/routes/pages_route.dart';
import 'package:project_one/feature/auth/presentation/views/forget_passwerd/reset_password/reset_password.dart';
import 'package:project_one/feature/auth/presentation/views/forget_passwerd/verify_email/verfiyEmail.dart';
import 'package:project_one/feature/layout/presentation/layout_screen.dart';
import 'package:project_one/feature/onboarding/presentation/views/on_boarding_screen.dart';
import 'package:project_one/feature/user_profile/view/update_profile_screen.dart';

import '../../feature/auth/presentation/views/forget_passwerd/forget_paswerd_screen.dart';
import '../../feature/auth/presentation/views/sign_in_screen.dart';
import '../../feature/auth/presentation/views/sign_up_screen.dart';
import '../../feature/layout/presentation/tabs/prize_tab.dart';
import '../../feature/layout/presentation/manager/prize_cubit/prize_tab_view_model.dart';
import '../../feature/product/view/product_details_screen.dart';
import '../../feature/product/view/product_screen.dart';
import '../../feature/redeem_code/view/redeem_code_screen.dart';
import '../../feature/user_profile/view/profile_screen.dart';

class RoutesGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoute.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
          settings: settings,
        );
      case PagesRoute.signUpScreen:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
          settings: settings,
        );
      case PagesRoute.signInScreen:
        return MaterialPageRoute(
          builder: (context) => SignInScreen(),
          settings: settings,
        );
      case PagesRoute.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordScreen(),
          settings: settings,
        );
      case PagesRoute.verifyEmail:
        return MaterialPageRoute(
          builder: (context) => VerifyOtpScreen(),
          settings: settings,
        );
      case PagesRoute.resetPassword:
        return MaterialPageRoute(
          builder: (context) => const ResetPasswordViewBody(),
          settings: settings,
        );
      case PagesRoute.layOutScreen:
        return MaterialPageRoute(
          builder: (context) => LayoutScreen(),
          settings: settings,
        );
      case PagesRoute.profile:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
          settings: settings,
        );
      case PagesRoute.updateProfile:
        return MaterialPageRoute(
          builder: (context) => const UpdateProfileScreen(),
          settings: settings,
        );
      case PagesRoute.redeemCode:
        return MaterialPageRoute(
          builder: (context) => const RedeemCodeScreen(),
          settings: settings,
        );
      case PagesRoute.prizeScreen:
        final viewModel = settings.arguments as PrizesViewModel;
        return MaterialPageRoute(
          builder: (context) => PrizeScreen(viewModel: viewModel),
          settings: settings,
        );
      case PagesRoute.productScreen:
        return MaterialPageRoute(
          builder: (context) => const ProductScreen(),
          settings: settings,
        );
      case PagesRoute.productDetailsScreen:
        return MaterialPageRoute(
          builder: (context) => const ProductDetailsScreen(),
          settings: settings,
        );
      default:
        return unDefinedRoute();
    }
  }
}

Route<dynamic> unDefinedRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Un defined route"),
          centerTitle: true,
        ),
        body: const Center(child: Text("Un defined route")),
      );
    },
  );
}
