abstract class HttpClient {
  Future<ClientResponse<T>> request<T>(
    String path, {
    required HttpMethod method,
    dynamic data,
    Map<String, String>? queryParameter,
    Map<String, String>? header,
  });
}

class ClientResponse<T> {
  final T? data;
  final int? statusCode;
  final String? statusMessage;
  final Map<String, String>? headers;
  final bool isRedirect;
  final Map<String, String>? extras;
  ClientResponse({
    this.data,
    this.statusCode,
    this.statusMessage,
    this.headers,
    this.isRedirect = false,
    this.extras,
  });
}

enum HttpMethod { get, post, put, delete, patch }
