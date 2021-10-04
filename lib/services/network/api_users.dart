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
  Future<User> register(@Body() User user);

  @POST("auth/login")
  Future<User> login(@Body() User user);

  @PATCH("profile/change_password")
  Future<User> changePassword(@Body() User user);

  @GET("profile")
  Future<User> profile();

  @PUT("profile")
  Future<User> updateProfile(@Body() User user);

  @GET("municipios")
  Future<List<Municipios>> fetchMunicipios();

  @GET("provincias")
  Future<List<Provincias>> fetchProvincias();
}
