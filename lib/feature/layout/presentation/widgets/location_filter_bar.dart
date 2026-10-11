import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../manager/find_users_cubit/find_users_state.dart';
import '../manager/find_users_cubit/find_users_view_model.dart';

class LocationFilterBar extends StatelessWidget {
  const LocationFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<FindUsersCubit>();
    final state = cubit.state;
    var tr=S.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [

          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _FilterChip(
                label:tr.village,
                selected: state.locationFilter == LocationFilter.full,
                onTap: () => cubit.changeLocationFilter(LocationFilter.full),
              ),
              _FilterChip(
                label:tr.city,
                selected: state.locationFilter == LocationFilter.city,
                onTap: () => cubit.changeLocationFilter(LocationFilter.city),
              ),
              _FilterChip(
                label: tr.governorate,
                selected: state.locationFilter == LocationFilter.governorate,
                onTap: () => cubit.changeLocationFilter(LocationFilter.governorate),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onTap(),
      backgroundColor: AppColors.whiteColor,
      selectedColor: AppColors.primaryColor.withOpacity(.2),
      labelStyle: TextStyle(
        color: selected ? AppColors.primaryColor : Colors.black,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
