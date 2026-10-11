import '../../../../../data/model/find_users_response_model.dart';
enum LocationFilter {
  full,
  city,
  governorate,
}

extension LocationFilterX on LocationFilter {
  String get value {
    switch (this) {
      case LocationFilter.full:
        return 'villige';
      case LocationFilter.city:
        return 'city';
      case LocationFilter.governorate:
        return 'governorate';
    }
  }
}

class FindUsersState {
  final List<FindUserItemModel> users;
  final bool isLoading;
  final bool isLoadingMore;
  final String? errorMessage;

  final int currentPage;
  final bool hasMore;
  final LocationFilter locationFilter;

  const FindUsersState({
    this.users = const [],
    this.isLoading = false,
    this.isLoadingMore = false,
    this.errorMessage,
    this.currentPage = 1,
    this.hasMore = true,
    this.locationFilter = LocationFilter.full,
  });

  FindUsersState copyWith({
    List<FindUserItemModel>? users,
    bool? isLoading,
    bool? isLoadingMore,
    String? errorMessage,
    int? currentPage,
    bool? hasMore,
    LocationFilter? locationFilter,
  }) {
    return FindUsersState(
      users: users ?? this.users,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      errorMessage: errorMessage,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      locationFilter: locationFilter ?? this.locationFilter,
    );
  }
}
