import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/common/result.dart';
import '../../../../../data/repository/find_user_tab_repository.dart';
import 'find_users_state.dart';

@injectable
class FindUsersCubit extends Cubit<FindUsersState> {
  final FindUsersRepository repository;

  FindUsersCubit(this.repository) : super(const FindUsersState());

  Future<void> loadUsers({bool refresh = false}) async {
    if (state.isLoading) return;

    if (!refresh && state.users.isNotEmpty) return;

    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        currentPage: 1,
        hasMore: true,
        users: refresh ? [] : state.users,
      ),
    );

    final result = await repository.findUsers(
      locationFilter: state.locationFilter.value,
      page: 1,
    );

    switch (result) {
      case Success():
        emit(
          state.copyWith(
            isLoading: false,
            users: result.data!.users,
            currentPage: 1,
            hasMore: result.data!.hasMore,
          ),
        );
        break;

      case Error():
        emit(state.copyWith(isLoading: false, errorMessage: result.message));
        break;
    }
  }

  Future<void> loadMore() async {
    if (state.isLoadingMore || !state.hasMore) return;

    emit(state.copyWith(isLoadingMore: true));

    final nextPage = state.currentPage + 1;

    final result = await repository.findUsers(
      locationFilter: state.locationFilter.value,
      page: nextPage,
    );

    switch (result) {
      case Success():
        emit(
          state.copyWith(
            isLoadingMore: false,
            users: [...state.users, ...result.data!.users],
            currentPage: nextPage,
            hasMore: result.data!.hasMore,
          ),
        );
        break;

      case Error():
        emit(
          state.copyWith(isLoadingMore: false, errorMessage: result.message),
        );
        break;
    }
  }

  Future<void> changeLocationFilter(LocationFilter filter) async {
    if (state.locationFilter == filter) return;

    emit(
      state.copyWith(
        locationFilter: filter,
        users: [],
        currentPage: 1,
        hasMore: true,
      ),
    );

    await loadUsers(refresh: true);
  }

  Future<void> callPhoneNumber(String phone) async {
    final Uri uri = Uri(scheme: 'tel', path: phone);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $phone';
    }
  }

  void clear() {
    emit(const FindUsersState());
  }
}
