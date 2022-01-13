import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:detooo_recargas/utils/constant.dart';
import 'package:detooo_recargas/models/detooo/sections_model.dart';
import 'package:detooo_recargas/services/network/dio_instances.dart';

part 'api_detooo.g.dart';

@RestApi(baseUrl: API_DETOOO)
abstract class APIdetooo {
  factory APIdetooo(Dio dio, {String baseUrl}) = _APIdetooo;

  static APIdetooo common() => APIdetooo(dioCommon());

  @GET("docs/filter?app=recargas")
  Future<List<SectionsModel>> readTerms();
}
