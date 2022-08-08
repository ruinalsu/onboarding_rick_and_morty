import 'package:dio/dio.dart';
import 'package:rick_and_morty/config/urls.dart';

/// HTTP client for Rick and Morty API
class ApiClient {
  final Dio _client;

  /// Creates an instance of [ApiClient]
  const ApiClient(Dio client) : _client = client;

  /// Preforms get request to [endpoint]
  Future<Response<String>> get(String endpoint) async {
    return _client.get<String>('${Url.baseUrl}$endpoint');
  }
}
