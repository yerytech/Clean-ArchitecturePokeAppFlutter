import 'package:dio/dio.dart';
import 'package:pruebadeclases/core/httpclient/http_client.dart';

class DioHttpClient implements HttpClient {
  final Dio _dio;

  DioHttpClient({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<ClientResponse<T>> request<T>(
    String path, {
    required HttpMethod method,
    dynamic data,
    Map<String, dynamic>? queryParameter,
    Map<String, String>? header,
  }) async {
    try {
      final dioResponse = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameter,
        options: Options(method: method.name.toUpperCase(), headers: header),
      );

      return ClientResponse<T>(
        data: dioResponse.data as T?,
        statusCode: dioResponse.statusCode,
        statusMessage: dioResponse.statusMessage,
        headers: dioResponse.headers.map.map(
          (key, value) => MapEntry(key, value.join(',')),
        ),
      );
    } catch (e) {
      return ClientResponse<T>(statusCode: 500, statusMessage: e.toString());
    }
  }
}
