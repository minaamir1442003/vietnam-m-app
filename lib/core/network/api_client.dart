import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:project_one/data/model/get_all_categories_response.dart';
import 'package:project_one/data/model/home_tab_response_model.dart';
import 'package:project_one/data/model/prize_tab_response_model.dart';
import 'package:project_one/data/model/update_user_response_model.dart';
import 'package:project_one/data/model/user_profile_response_model.dart';
import 'package:project_one/feature/auth/data/model/sign_in_response_dto.dart';
import 'package:project_one/feature/auth/domain/entity/reset_password_response_entity.dart';
import 'package:project_one/feature/location/data/models/location_response_dto.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../data/model/find_users_response_model.dart';
import '../../data/model/products_response_model.dart';
import '../../data/model/redeem_code_response_code.dart';
import '../../data/model/wallet_tab_response_model.dart';
import '../../feature/auth/data/model/forget_response_password_dto.dart';
import '../../feature/auth/data/model/reset_password_dto.dart';
import '../../feature/auth/data/model/sign_up_response_dto.dart';
import '../../feature/auth/data/model/verify_otp_response_dto.dart';
import '../../feature/auth/domain/entity/sign_in_request.dart';
import '../../feature/auth/domain/entity/sign_up_request.dart';
import '../utils/end_points.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://app.vietnam-m.com")
@singleton
@injectable
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @POST("api/v1/register")
  Future<SignUpResponseDTO> signUp(@Body() SignUpRequest data);

  @POST(EndPoint.signIn)
  Future<SignInResponseDTO> signIn(@Body() SignInRequest data);

  @POST(EndPoint.forgotPassword)
  Future<ForgetResponsePasswordDto> forgetPassword(
    @Body() Map<String, dynamic> data,
  );

  @GET(EndPoint.getLocation)
  Future<LocationResponseDto> getLocation();

  @GET(EndPoint.userProfile)
  Future<UserProfileResponseModel> getUserProfile();

  @POST(EndPoint.logout)
  Future<void> logout();

  @POST(EndPoint.deleteAccount)
  Future<void> deleteAccount();

  @GET(EndPoint.homeTab)
  Future<HomeTabResponseModel> getHomeData();

  @GET(EndPoint.prizeTab)
  Future<PrizeTabResponseModel> getPrizeData();

  @POST(EndPoint.prizeTab)
  Future<ExchangePrizeResponseModel> exchangePrize(
    @Body() Map<String, dynamic> body,
  );

  @POST(EndPoint.userProfile)
  @MultiPart()
  Future<UpdateProfileResponseModel> updateUserProfile(
    @Part(name: 'firstname') String? firstname,
    @Part(name: 'lastname') String? lastname,
    @Part(name: 'email') String? email,
    @Part(name: 'phone') String? phone,
    @Part(name: 'image') File? image,
  );

  @POST(EndPoint.verifyOtp)
  Future<VerifyOtpResponseDto> verifyOtp(@Body() Map<String, dynamic> body);

  @GET(EndPoint.findUsersTab)
  Future<FindUsersResponseModel> findUsers(
    @Query("location_filter") String locationFilter,
    @Query("page") int page,
  );

  @GET(EndPoint.walletTab)
  Future<WalletResponseModel> getWalletData(@Query('page') int page);

  @POST(EndPoint.redeemCode)
  Future<RedeemCodeResponseModel> redeemCode(@Body() Map<String, dynamic> body);

  @GET(EndPoint.categoriesList)
  Future<GetAllCategoriesResponse> getAllCategories();

  @GET("${EndPoint.categoriesList}/{id}")
  Future<GetProductsResponseModel> getProducts(@Path('id') int categoryId);
}
