import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/result.dart';
import '../../../data/repository/redeem_code_repository.dart';
import 'redeem_code_state.dart';

@injectable
class RedeemCodeCubit extends Cubit<RedeemCodeState> {
  final RedeemCodeRepository _repository;

  RedeemCodeCubit(this._repository) : super(const RedeemCodeState());

  final TextEditingController codeController = TextEditingController();
  bool _hasScanned = false;

  void onCodeChanged(String value) {
    emit(
      state.copyWith(
        code: value.trim(),
        errorMessage: null,
        isSuccess: false,
      ),
    );
  }
  Future<void> onQrScanned(String scannedCode) async {
    if (_hasScanned || scannedCode.isEmpty || state.isLoading) return;

    _hasScanned = true;

    codeController.text = scannedCode;

    emit(
      state.copyWith(
        code: scannedCode,
        errorMessage: null,
      ),
    );

    await redeem();
  }

  Future<void> redeem() async {
    if (!state.canRedeem) return;

    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        isSuccess: false,
      ),
    );

    final result = await _repository.redeemCode(state.code);

    switch (result) {
      case Success():
        emit(
          state.copyWith(
            isLoading: false,
            isSuccess: true,
            pointsAdded: result.data?.pointsAdded,
            currentPoints: result.data?.currentPoints,
          ),
        );

        codeController.clear();
        _hasScanned = false;
        break;

      case Error():
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: result.message,
          ),
        );
        _hasScanned = false;
        break;
    }
  }

  @override
  Future<void> close() {
    codeController.dispose();
    return super.close();
  }
}
