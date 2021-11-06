// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_orders.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiOrders implements ApiOrders {
  _ApiOrders(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.v2.orders.detooo.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Paginated<Orders>> userOrders(page) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Paginated<Orders>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'orders/user?app=recargas&page=$page',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Paginated<Orders>.fromJson(
      _result.data!,
      (json) => Orders.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<Orders> orderDetail(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Orders>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'orders/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Orders.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Dashboard> userDashboard() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Dashboard>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'dashboard/client',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Dashboard.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
