import 'package:flutter/material.dart';
import 'package:project_one/core/widget/app_header.dart';
import 'package:project_one/feature/auth/presentation/views/widgets/sign_up_account_step.dart';
import 'package:project_one/feature/auth/presentation/views/widgets/sign_up_basic_info_step.dart';

import '../../../../../generated/l10n.dart';

class SignUpStepperBody extends StatefulWidget {
  const SignUpStepperBody({super.key});

  @override
  State<SignUpStepperBody> createState() => _SignUpStepperBodyState();
}

class _SignUpStepperBodyState extends State<SignUpStepperBody> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AppHeader(title: S.of(context).signUp, height: 0.26),
          SizedBox(height: 16),
          Expanded(
            child: PageView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                SignUpBasicInfoStep(
                  onNext: () {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                const SignUpAccountStep(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
