import 'dart:ui';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:rick_and_morty/config/app_config.dart';
import 'package:rick_and_morty/config/environment/environment.dart';
import 'package:rick_and_morty/features/navigation/service/router.dart';
import 'package:rick_and_morty/features/rick_and_morty/clients/api_client.dart';
import 'package:rick_and_morty/features/rick_and_morty/data/repositories/charactes_repoitory_impl.dart';
import 'package:rick_and_morty/features/rick_and_morty/domain/repositories/characters_repository.dart';
import 'package:rick_and_morty/features/rick_and_morty/domain/services/characters_service.dart';
import 'package:rick_and_morty/util/default_error_handler.dart';

/// Scope of dependencies which need through all app's life.
class AppScope implements IAppScope {
  late final Dio _dio;
  late final ApiClient _apiClient;
  late final ICharactersRepository _charactersRepository;
  late final CharactersService _charactersService;
  late final ErrorHandler _errorHandler;
  late final VoidCallback _applicationRebuilder;
  late final AppRouter _router;

  @override
  Dio get dio => _dio;

  @override
  ErrorHandler get errorHandler => _errorHandler;

  @override
  VoidCallback get applicationRebuilder => _applicationRebuilder;

  @override
  AppRouter get router => _router;

  @override
  CharactersService get charactersService => _charactersService;

  /// Create an instance [AppScope].
  AppScope({
    required VoidCallback applicationRebuilder,
  }) : _applicationRebuilder = applicationRebuilder {
    /// List interceptor. Fill in as needed.
    final additionalInterceptors = <Interceptor>[];

    _dio = _initDio(additionalInterceptors);
    _apiClient = ApiClient(_dio);
    _charactersRepository = CharactersRepositoryImpl(_apiClient);
    _charactersService = CharactersService(_charactersRepository);
    _errorHandler = DefaultErrorHandler();
    _router = AppRouter.instance();
  }

  Dio _initDio(Iterable<Interceptor> additionalInterceptors) {
    const timeout = Duration(seconds: 30);

    final dio = Dio();

    dio.options
      ..baseUrl = Environment<AppConfig>.instance().config.url
      ..connectTimeout = timeout.inMilliseconds
      ..receiveTimeout = timeout.inMilliseconds
      ..sendTimeout = timeout.inMilliseconds;

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      final proxyUrl = Environment<AppConfig>.instance().config.proxyUrl;
      if (proxyUrl != null && proxyUrl.isNotEmpty) {
        client
          ..findProxy = (uri) {
            return 'PROXY $proxyUrl';
          }
          ..badCertificateCallback = (_, __, ___) {
            return true;
          };
      }

      return client;
    };

    dio.interceptors.addAll(additionalInterceptors);

    if (Environment<AppConfig>.instance().isDebug) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }

    return dio;
  }
}

/// App dependencies.
abstract class IAppScope {
  /// Http client.
  Dio get dio;

  /// Interface for handle error in business logic.
  ErrorHandler get errorHandler;

  /// Callback to rebuild the whole application.
  VoidCallback get applicationRebuilder;

  /// Class that coordinates navigation for the whole app.
  AppRouter get router;

  /// Characters service
  CharactersService get charactersService;
}
