import 'package:rick_and_morty/config/app_config.dart';
import 'package:rick_and_morty/config/environment/environment.dart';

/// Server urls.
abstract class Url {
  /// Prod proxy url.
  static String get prodProxyUrl => '';

  /// QA proxy url.
  static String get qaProxyUrl => '192.168.0.1';

  /// Dev proxy url.
  static String get devProxyUrl => '';

  /// TRest url.
  static String get testUrl => 'https://rickandmortyapi.com/api';

  /// Prod url.
  static String get prodUrl => 'https://rickandmortyapi.com/api';

  /// Dev url.
  static String get devUrl => 'https://rickandmortyapi.com/api';

  /// Base url.
  static String get baseUrl => Environment<AppConfig>.instance().config.url;
}
