import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injectable_initializer.dart';
import '../../../../core/utils/app_assets.dart';
import '../manager/find_users_cubit/find_users_view_model.dart';
import '../widgets/find_users_list.dart';
import '../widgets/location_filter_bar.dart';

class FindUsersTab extends StatelessWidget {
  const FindUsersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt.get<FindUsersCubit>()..loadUsers(),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.bacground),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: const [
            SizedBox(height: 32),
            LocationFilterBar(),
            Expanded(child: FindUsersList()),
          ],
        ),
      ),
    );
  }
}
