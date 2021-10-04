// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_users.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _APIUsers implements APIUsers {
  _APIUsers(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.v2.users.detooo.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<User> register(user) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(user.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<User>(
        Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, 'auth/register/',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = User.fromJson(_result.data!);
    return value;
  }

  @override
  Future<User> login(user) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(user.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<User>(
        Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, 'auth/login',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = User.fromJson(_result.data!);
    return value;
  }

  @override
  Future<User> changePassword(user) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(user.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<User>(
        Options(method: 'PATCH', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, 'profile/change_password',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = User.fromJson(_result.data!);
    return value;
  }

  @override
  Future<User> profile() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<User>(
        Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, 'profile',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = User.fromJson(_result.data!);
    return value;
  }

  @override
  Future<User> updateProfile(user) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(user.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<User>(
        Options(method: 'PUT', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, 'profile',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = User.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<Municipios>> fetchMunicipios() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Municipios>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'municipios',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Municipios.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<Provincias>> fetchProvincias() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Provincias>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'provincias',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Provincias.fromJson(i as Map<String, dynamic>))
        .toList();
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
