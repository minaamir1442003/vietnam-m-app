import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../domain/entity/sign_up_request.dart';
import '../../cubit/signup_state.dart';
import '../../cubit/signup_view_model.dart';
import '../widgets/user_type_localization.dart';

class AccountTypeCard extends StatelessWidget {
  final UserType type;
  final bool isSelected;
  final VoidCallback onTap;

  const AccountTypeCard({
    super.key,
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isSelected ? 1.08 : 1.0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOutBack,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? AppColors.primaryColor
                  : Colors.grey.shade300,
              width: 2,
            ),
            color: isSelected
                ? AppColors.primaryColor.withOpacity(.3)
                : Colors.white,
            boxShadow: isSelected
                ? [
              BoxShadow(
                color: AppColors.primaryColor.withOpacity(.2),
                blurRadius: 12,
                offset: const Offset(0, 6),
              )
            ]
                : [],
          ),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      type.icon(),
                      size:isSelected? 42 :32,
                      color: isSelected
                          ? AppColors.primaryColor
                          : Colors.grey,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      type.label(context),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: isSelected
                            ? AppColors.primaryColor
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              if (isSelected)
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: AppColors.primaryColor,
                    child: const Icon(
                      Icons.check,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
class AccountTypeSelector extends StatelessWidget {
  const AccountTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpViewModel, SignUpState>(
      buildWhen: (p, c) => p.userType != c.userType,
      builder: (context, state) {
        final vm = context.read<SignUpViewModel>();

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: UserType.values.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (_, index) {
            final type = UserType.values[index];
            return AccountTypeCard(
              type: type,
              isSelected: state.userType == type,
              onTap: () => vm.selectUserType(type),
            );
          },
        );
      },
    );
  }
}
