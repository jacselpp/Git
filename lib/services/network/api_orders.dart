import 'package:detooo_recargas/models/auth/dashboard_model.dart';
import 'package:detooo_recargas/models/recargas/orders_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:detooo_recargas/services/network/dio_instances.dart';
import 'package:detooo_recargas/utils/constant.dart';

part 'api_orders.g.dart';

@RestApi(baseUrl: API_ORDERS)
abstract class ApiOrders {
  factory ApiOrders(Dio dio, {String baseUrl}) = _ApiOrders;

  static ApiOrders common() => ApiOrders(dioCommon());

  @GET("orders/user")
  Future<List<Orders>> userOrders();

  @GET("orders/{id}")
  Future<Orders> orderDetail(@Path('id') String id);

  @GET("dashboard/client")
  Future<Dashboard> userDashboard();
}
