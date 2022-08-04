import 'package:rick_and_morty/config/app_config.dart';
import 'package:rick_and_morty/config/debug_options.dart';
import 'package:rick_and_morty/config/environment/build_types.dart';
import 'package:rick_and_morty/config/environment/environment.dart';
import 'package:rick_and_morty/config/urls.dart';
import 'package:rick_and_morty/runner.dart';

/// Main entry point of app.
void main() {
  Environment.init(
    buildType: BuildType.debug,
    config: AppConfig(
      url: Url.testUrl,
      proxyUrl: Url.devProxyUrl,
      debugOptions: DebugOptions(
        debugShowCheckedModeBanner: true,
      ),
    ),
  );

  run();
}
