import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_one/core/utils/app_colors.dart';
import 'package:project_one/core/utils/text_styles.dart';

import '../../../../../core/utils/constans.dart';
import '../../../../../generated/l10n.dart';
import '../../../../location/domain/entity/location_response_entity.dart';
import '../../cubit/signup_view_model.dart';
import '../../cubit/signup_state.dart';
import 'account_type_card.dart';

class SignUpAccountStep extends StatelessWidget {
  const SignUpAccountStep({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = S.of(context);

    return BlocBuilder<SignUpViewModel, SignUpState>(
      buildWhen: (p, c) =>
          p.userType != c.userType ||
          p.selectedGovernorate != c.selectedGovernorate ||
          p.selectedCity != c.selectedCity ||
          p.selectedVillage != c.selectedVillage ||
          p.governorates != c.governorates,
      builder: (context, state) {
        final vm = context.read<SignUpViewModel>();

        final governorates = state.governorates;

        final cities = state.selectedGovernorate?.cities ?? [];
        final villages = state.selectedCity?.villages ?? [];

        final GovernorateEntity? governorateValue =
            governorates.any((g) => g.id == state.selectedGovernorate?.id)
            ? state.selectedGovernorate
            : null;

        final CityEntity? cityValue =
            cities.any((c) => c.id == state.selectedCity?.id)
            ? state.selectedCity
            : null;

        final VillageEntity? villageValue =
            villages.any((v) => v.id == state.selectedVillage?.id)
            ? state.selectedVillage
            : null;

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.withOpacity(.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Text(tr.accountType,style: AppTextStyles.inter600_18,),
                const SizedBox(height: 12),
                const AccountTypeSelector(),

                const SizedBox(height: 24),

                DropdownButtonFormField<GovernorateEntity>(
                  isExpanded: true,
                  hint: Text(tr.governorate),
                  value: governorateValue,
                  dropdownColor: Colors.white,
                  iconEnabledColor: AppColors.blackColor,
                  focusColor: AppColors.primaryColor.withOpacity(.4),

                  items: governorates
                      .map(
                        (g) => DropdownMenuItem(
                            value: g, child: Text(g.name)),
                      )
                      .toList(),
                  onChanged: (v) {
                    if (v != null) {
                      vm.selectGovernorate(v);
                    }
                  },
                ),

                const SizedBox(height: 16),
                DropdownButtonFormField<CityEntity>(
                  isExpanded: true,
                  hint: Text(tr.city),
                  dropdownColor: Colors.white,
                  iconEnabledColor: AppColors.blackColor,
                  focusColor: AppColors.primaryColor.withOpacity(.4),                  value: cityValue,
                  items: cities
                      .map(
                        (c) => DropdownMenuItem(value: c, child: Text(c.name)),
                      )
                      .toList(),
                  onChanged: governorateValue == null
                      ? null
                      : (v) {
                          if (v != null) {
                            vm.selectCity(v);
                          }
                        },
                ),

                const SizedBox(height: 16),

                DropdownButtonFormField<VillageEntity>(
                  isExpanded: true,
                  hint: Text(tr.village),
                  dropdownColor: Colors.white,
                  iconEnabledColor: AppColors.blackColor,
                  focusColor: AppColors.primaryColor.withOpacity(.4),
                  value: villageValue,
                  items: villages
                      .map(
                        (v) => DropdownMenuItem(value: v, child: Text(v.name)),
                      )
                      .toList(),
                  onChanged: cityValue == null
                      ? null
                      : (v) {
                          if (v != null) {
                            vm.selectVillage(v);
                          }
                        },
                ),

                const SizedBox(height: 32),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 250),
                  opacity: state.canSubmit ? 1 : 0.4,
                  child: ElevatedButton(
                    onPressed: state.canSubmit
                        ? () async {
                            vm.signUp(context);
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(52),
                    ),
                    child: Text(tr.signUp),
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }
}
