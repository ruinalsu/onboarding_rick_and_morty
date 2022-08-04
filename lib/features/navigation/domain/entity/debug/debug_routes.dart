import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/features/debug/screens/debug_screen/debug_screen.dart';
import 'package:rick_and_morty/features/navigation/domain/entity/app_route_names.dart';
import 'package:rick_and_morty/features/navigation/domain/entity/app_route_paths.dart';

/// All routes for the debug feature.
const debugRoutes = AutoRoute<dynamic>(
  path: AppRoutePaths.debugPath,
  name: AppRouteNames.debugScreen,
  page: DebugScreen,
);
