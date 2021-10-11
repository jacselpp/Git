import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:detooo_recargas/models/auth/municipios_model.dart';
import 'package:detooo_recargas/models/auth/provincias_model.dart';
import 'package:detooo_recargas/models/auth/user_model.dart';
import 'package:detooo_recargas/services/network/dio_instances.dart';
import 'package:detooo_recargas/utils/constant.dart';

part 'api_users.g.dart';

@RestApi(baseUrl: API_USERS)
abstract class APIUsers {
  factory APIUsers(Dio dio, {String baseUrl}) = _APIUsers;

  static APIUsers common() => APIUsers(dioCommon());

  @POST("auth/register/")
  Future<User> register(@Body() UserRegister user);

  @POST("auth/login")
  Future<User> login(@Body() UserLogin user);

  @POST("auth/reset-password/request")
  Future<User> passwordReset(@Body() User user);

  @PATCH("profile/change_password")
  Future<User> changePassword(@Body() User user);

  @GET("profile")
  Future<User> profile();

  @PUT("profile")
  Future<User> updateProfile(@Body() User user);

  @GET("municipios")
  Future<List<Municipios>> fetchMunicipios();

  @GET("municipios/provincia/{id}")
  Future<List<Municipios>> fetchMunicipiosProvincia(@Path("id") String id);

  @GET("provincias/{id}")
  Future<Provincias> fetchProvincia(@Path("id") String id);

  @GET("auth/reset-password/verify/{id}")
  Future<List<Municipios>> verifyChangePassword(@Path("id") String id);

  @GET("/auth/verify/{id}")
  Future<List<Municipios>> verifyCreateUser(@Path("id") String id);

  @GET("provincias")
  Future<List<Provincias>> fetchProvincias();
}
