import 'package:detooo_recargas/models/auth/countries_model.dart';
import 'package:detooo_recargas/services/network/dio_instances.dart';
import 'package:detooo_recargas/utils/constant.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_countries.g.dart';

@RestApi(baseUrl: API_COUNTRIES)
abstract class APICountries {
  factory APICountries(Dio dio, {String baseUrl}) = _APICountries;

  static APICountries common() => APICountries(dioCommon());

  @GET("")
  Future<List<Country>> countriesRead();
}
