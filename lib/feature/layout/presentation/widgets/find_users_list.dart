import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_one/core/widget/custom_dialog.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../data/model/find_users_response_model.dart';
import '../../../../generated/l10n.dart';
import '../manager/find_users_cubit/find_users_state.dart';
import '../manager/find_users_cubit/find_users_view_model.dart';

class FindUsersList extends StatefulWidget {
  const FindUsersList({super.key});

  @override
  State<FindUsersList> createState() => _FindUsersListState();
}

class _FindUsersListState extends State<FindUsersList> {
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    if (_controller.position.pixels >=
        _controller.position.maxScrollExtent - 200) {
      context.read<FindUsersCubit>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    var tr = S.of(context);
    return BlocConsumer<FindUsersCubit, FindUsersState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          DialogUtils.showMessage(
            context: context,
            message: state.errorMessage!,
            title: tr.error,
            negativeActionName: tr.cancel,
            postActionName: tr.retry,
            postAction: () {
              context.read<FindUsersCubit>().loadUsers();
            },
          );
        }
      },
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.primaryColor,
            ),
          );
        }

        if (state.users.isEmpty) {
          return Center(
            child: Text(
              state.errorMessage ?? S.of(context).noFoundedUsers,
              style: AppTextStyles.inter600_18,
            ),
          );
        }

        return ListView.builder(
          controller: _controller,
          padding: const EdgeInsets.only(top: 8, bottom: 16),
          itemCount: state.users.length + (state.isLoadingMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == state.users.length) {
              return const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: CircularProgressIndicator()),
              );
            }

            return FindUserCard(user: state.users[index]);
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class FindUserCard extends StatelessWidget {
  final FindUserItemModel user;

  const FindUserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    var tr = S.of(context);
    return InkWell(
      onTap: () {
        DialogUtils.showMessage(
          context: context,
          title: tr.contact,
          message: '${tr.doYouWantToContact} ${user.name}?',
          postActionName: tr.contact,
          postAction: () =>
              context.read<FindUsersCubit>().callPhoneNumber(user.phone),
          negativeActionName: tr.cancel,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.primaryColor.withOpacity(0.2),
              backgroundImage: user.image != null
                  ? NetworkImage(user.image!)
                  : null,
              child: user.image == null
                  ? const Icon(
                      Icons.person,
                      color: AppColors.primaryColor,
                      size: 32,
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.name, style: AppTextStyles.inter500_16),
                  const SizedBox(height: 4),
                  Text(
                    user.phone,
                    style: AppTextStyles.inter400_14.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.phone, size: 20, color: AppColors.primaryColor),
          ],
        ),
      ),
    );
  }
}
