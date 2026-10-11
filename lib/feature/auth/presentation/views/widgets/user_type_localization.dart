import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/entity/sign_up_request.dart';

extension UserTypeLocalization on UserType {
  String label(BuildContext context) {
    switch (this) {
      case UserType.user:
        return S.of(context).user;
      case UserType.worker:
        return S.of(context).worker;
      case UserType.merchant:
        return S.of(context).merchant;
      case UserType.distributor:
        return S.of(context).distributor;
    }
  }
}
