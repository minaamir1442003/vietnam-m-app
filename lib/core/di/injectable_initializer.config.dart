// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../data/data_source/category_tab_remote_data_source.dart' as _i1030;
import '../../data/data_source/find_users_tab_data_source.dart' as _i903;
import '../../data/data_source/get_all_products_remote_data_source.dart'
    as _i603;
import '../../data/data_source/home_tab_remote_data_source.dart' as _i530;
import '../../data/data_source/prize_tab_remote_data_source.dart' as _i920;
import '../../data/data_source/redeem_code_remote_data_source.dart' as _i903;
import '../../data/data_source/user_profile_remote_data_source.dart' as _i541;
import '../../data/data_source/wallet_tab_remote_data_source.dart' as _i840;
import '../../data/repository/category_tab_repository.dart' as _i23;
import '../../data/repository/find_user_tab_repository.dart' as _i808;
import '../../data/repository/get_all_products_repo.dart' as _i821;
import '../../data/repository/home_tab_repository.dart' as _i116;
import '../../data/repository/prize_tab_repository.dart' as _i620;
import '../../data/repository/redeem_code_repository.dart' as _i242;
import '../../data/repository/user_profile_repository.dart' as _i796;
import '../../data/repository/wallet_tab_repository.dart' as _i985;
import '../../feature/auth/data/data_source/auth_remote_data_source.dart'
    as _i140;
import '../../feature/auth/data/repository_imp/auth_repository_imp.dart'
    as _i384;
import '../../feature/auth/domain/repository/auth_repository.dart' as _i884;
import '../../feature/auth/domain/use_case/auth_use_case.dart' as _i137;
import '../../feature/auth/domain/use_case/sign_in%20_use_case.dart' as _i586;
import '../../feature/auth/presentation/cubit/forget_password_cubit/forget_password_view_model.dart'
    as _i1056;
import '../../feature/auth/presentation/cubit/reset_password_cubit/reset_password_view_model.dart'
    as _i828;
import '../../feature/auth/presentation/cubit/sign_in_cubit/sign_in_view_model.dart'
    as _i741;
import '../../feature/auth/presentation/cubit/signup_view_model.dart' as _i939;
import '../../feature/auth/presentation/cubit/verfy_code/verify_code_view_model.dart'
    as _i342;
import '../../feature/layout/presentation/manager/category_cubit/category_tab_view_model.dart'
    as _i332;
import '../../feature/layout/presentation/manager/find_users_cubit/find_users_view_model.dart'
    as _i919;
import '../../feature/layout/presentation/manager/home_cubit/home_tab_view_model.dart'
    as _i306;
import '../../feature/layout/presentation/manager/prize_cubit/prize_tab_view_model.dart'
    as _i130;
import '../../feature/layout/presentation/manager/wallet_cubit/wallet_tab_view_model.dart'
    as _i930;
import '../../feature/location/data/data_source/location_data_source.dart'
    as _i332;
import '../../feature/location/data/repository_impl/location_repository_impl.dart'
    as _i301;
import '../../feature/location/domain/repository/location_reposiitory.dart'
    as _i791;
import '../../feature/location/domain/use_cae/location_use_case.dart' as _i296;
import '../../feature/location/presentation/cubit/location_view_model.dart'
    as _i720;
import '../../feature/onboarding/presentation/cubits/change_onboarding_view_model.dart'
    as _i480;
import '../../feature/product/manager/products_view_model.dart' as _i125;
import '../../feature/redeem_code/manager/redeem_code_view_model.dart' as _i360;
import '../../feature/user_profile/manager/update_profile_cubit/update_profile_view_model.dart'
    as _i280;
import '../../feature/user_profile/manager/user_profile_view_model.dart'
    as _i1055;
import '../network/api_client.dart' as _i557;
import '../network/network_factory.dart' as _i785;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioProvider = _$DioProvider();
    gh.factory<_i480.ChangeOnboardingViewModel>(
      () => _i480.ChangeOnboardingViewModel(),
    );
    gh.lazySingleton<_i361.Dio>(() => dioProvider.dioProvider());
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioProvider.providePretty());
    gh.lazySingleton<_i785.AuthInterceptor>(() => _i785.AuthInterceptor());
    gh.factory<_i840.WalletTabRemoteDataSource>(
      () => _i840.WalletTabRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.singleton<_i557.ApiClient>(() => _i557.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i541.UserProfileRemoteDataSource>(
      () => _i541.UserProfileRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.factory<_i985.WalletTabRepository>(
      () =>
          _i985.WalletTabRepositoryImpl(gh<_i840.WalletTabRemoteDataSource>()),
    );
    gh.factory<_i930.WalletCubit>(
      () => _i930.WalletCubit(gh<_i985.WalletTabRepository>()),
    );
    gh.factory<_i796.UserProfileRepository>(
      () => _i796.UserProfileRepositoryImpl(
        gh<_i541.UserProfileRemoteDataSource>(),
      ),
    );
    gh.factory<_i332.LocationRemoteDataSource>(
      () => _i332.LocationRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.factory<_i1055.ProfileViewModel>(
      () => _i1055.ProfileViewModel(gh<_i796.UserProfileRepository>()),
    );
    gh.factory<_i140.AuthRemoteDataSource>(
      () => _i140.AuthRemoteDataSourceImpl(
        gh<_i557.ApiClient>(),
        gh<_i361.Dio>(),
      ),
    );
    gh.factory<_i1030.CategoryTabRemoteDataSource>(
      () => _i1030.CategoryTabRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.factory<_i791.LocationRepository>(
      () => _i301.LocationRepositoryImpl(gh<_i332.LocationRemoteDataSource>()),
    );
    gh.factory<_i903.FindUsersRemoteDataSource>(
      () => _i903.FindUsersRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.factory<_i530.HomeTabRemoteDataSource>(
      () => _i530.HomeTabRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.factory<_i903.RedeemCodeRemoteDataSource>(
      () => _i903.RedeemCodeRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.factory<_i23.CategoryTabRepository>(
      () => _i23.CategoryTabRepositoryImpl(
        gh<_i1030.CategoryTabRemoteDataSource>(),
      ),
    );
    gh.factory<_i603.GetAllProductsRemoteDataSource>(
      () => _i603.GetAllProductsRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.factory<_i920.PrizeTabRemoteDataSource>(
      () => _i920.PrizeTabRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.factory<_i280.UpdateProfileViewModel>(
      () => _i280.UpdateProfileViewModel(gh<_i796.UserProfileRepository>()),
    );
    gh.factory<_i332.CategoryTabViewModel>(
      () => _i332.CategoryTabViewModel(gh<_i23.CategoryTabRepository>()),
    );
    gh.factory<_i821.GetAllProductsRepo>(
      () => _i821.GetAllProductsRepoImpl(
        gh<_i603.GetAllProductsRemoteDataSource>(),
      ),
    );
    gh.factory<_i884.AuthRepository>(
      () => _i384.AuthRepositoryImpl(gh<_i140.AuthRemoteDataSource>()),
    );
    gh.factory<_i296.LocationUseCase>(
      () => _i296.LocationUseCase(gh<_i791.LocationRepository>()),
    );
    gh.factory<_i808.FindUsersRepository>(
      () =>
          _i808.FindUsersRepositoryImpl(gh<_i903.FindUsersRemoteDataSource>()),
    );
    gh.factory<_i620.PrizeTabRepository>(
      () => _i620.PrizeTabRepositoryImpl(gh<_i920.PrizeTabRemoteDataSource>()),
    );
    gh.factory<_i116.HomeTabRepository>(
      () => _i116.HomeTabRepositoryImpl(gh<_i530.HomeTabRemoteDataSource>()),
    );
    gh.factory<_i137.AuthUseCase>(
      () => _i137.AuthUseCase(gh<_i884.AuthRepository>()),
    );
    gh.factory<_i586.SignInUseCase>(
      () => _i586.SignInUseCase(gh<_i884.AuthRepository>()),
    );
    gh.factory<_i242.RedeemCodeRepository>(
      () => _i242.RedeemCodeRepositoryImpl(
        gh<_i903.RedeemCodeRemoteDataSource>(),
      ),
    );
    gh.factory<_i125.ProductsViewModel>(
      () => _i125.ProductsViewModel(gh<_i821.GetAllProductsRepo>()),
    );
    gh.factory<_i360.RedeemCodeCubit>(
      () => _i360.RedeemCodeCubit(gh<_i242.RedeemCodeRepository>()),
    );
    gh.factory<_i130.PrizesViewModel>(
      () => _i130.PrizesViewModel(gh<_i620.PrizeTabRepository>()),
    );
    gh.factory<_i1056.ForgetPasswordViewModel>(
      () => _i1056.ForgetPasswordViewModel(gh<_i137.AuthUseCase>()),
    );
    gh.factory<_i828.ResetPasswordViewModel>(
      () => _i828.ResetPasswordViewModel(gh<_i137.AuthUseCase>()),
    );
    gh.factory<_i342.VerifyOtpViewModel>(
      () => _i342.VerifyOtpViewModel(gh<_i137.AuthUseCase>()),
    );
    gh.factory<_i306.HomeCubit>(
      () => _i306.HomeCubit(gh<_i116.HomeTabRepository>()),
    );
    gh.factory<_i741.SignInViewModel>(
      () => _i741.SignInViewModel(gh<_i586.SignInUseCase>()),
    );
    gh.factory<_i919.FindUsersCubit>(
      () => _i919.FindUsersCubit(gh<_i808.FindUsersRepository>()),
    );
    gh.factory<_i939.SignUpViewModel>(
      () => _i939.SignUpViewModel(
        gh<_i137.AuthUseCase>(),
        gh<_i296.LocationUseCase>(),
      ),
    );
    gh.factory<_i720.LocationCubit>(
      () => _i720.LocationCubit(gh<_i296.LocationUseCase>()),
    );
    return this;
  }
}

class _$DioProvider extends _i785.DioProvider {}
