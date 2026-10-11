import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_one/core/utils/app_assets.dart';

import '../../../../core/di/injectable_initializer.dart';
import '../../../../generated/l10n.dart';
import '../cubit/sign_in_cubit/sign_in_view_model.dart';
import 'widgets/sign_in_view_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SignInViewModel>(),
      child: WillPopScope(
        onWillPop:()async {
          SystemNavigator.pop();
          return false;
        } ,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(ImageAssets.bacground),
                fit: BoxFit.cover,
              ),
            ),
            child: const SignInViewBody(),
          ),
        ),
      ),
    );
  }
}
