import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one/data/model/home_tab_response_model.dart';
import 'package:project_one/data/repository/home_tab_repository.dart';

import '../../../../../core/common/result.dart';
import 'home_tab_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final HomeTabRepository repository;

  HomeCubit(this.repository) : super(HomeInitial());
  List<AdsResponseModel>ads = [];
  List<PrizeResponseModel>prizes = [];

  Future<void> loadHome({bool forceRefresh = false}) async {
    if (state is HomeLoaded && !forceRefresh) return;

    emit(HomeLoading());
    final data = await repository.getHomeData();

    switch (data) {
      case Success() :
        ads = data.data?.ads ?? [];
        prizes = data.data?.prizes ?? [];
        emit(HomeLoaded(data.data!));
      case Error():
        emit(HomeError(data.message.toString()));
    }
  }
    void clear() {
      emit(HomeInitial());
    }
  }
