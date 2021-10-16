import 'dart:io';

import 'package:detooo_recargas/models/recargas/testimonials_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:detooo_recargas/models/auth/municipios_model.dart';
import 'package:detooo_recargas/models/auth/user_model.dart';
import 'package:detooo_recargas/services/network/dio_instances.dart';
import 'package:detooo_recargas/utils/constant.dart';

part 'api_users.g.dart';

@RestApi(baseUrl: API_USERS)
abstract class APIUsers {
  factory APIUsers(Dio dio, {String baseUrl}) = _APIUsers;

  static APIUsers common() => APIUsers(dioCommon());

  @POST("auth/register/")
  Future<Profile> register(@Body() User user);

  @POST("auth/login")
  Future<UserLogin> login(@Body() User user);

  @POST("auth/reset-password/request")
  Future<void> passwordReset(@Body() User user);

  @POST("auth/movil/verify")
  Future<void> verifyMovil(@Body() UserVerifyMovil user);

  @POST("auth/movil/resend_activation_code")
  Future<void> resendMovileCode(@Body() UserVerifyMovil user);

  @PATCH("profile/change_password")
  Future<void> changePassword(@Body() UserPassword user);

  @GET("profile")
  Future<Profile> profile();

  @PUT("profile")
  Future<Profile> updateProfile(@Body() Profile user);

  @GET("users/public/list?id={id}")
  Future<List<Profile>> fetchUserById(@Path("id") String id);

  @GET("auth/reset-password/verify/{id}")
  Future<void> verifyChangePassword(@Path("id") String id);

  @GET("auth/verify/{id}")
  Future<void> verifyCreateUser(@Path("id") String id);
}
