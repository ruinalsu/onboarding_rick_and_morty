import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/features/navigation/domain/entity/app_route_names.dart';
import 'package:rick_and_morty/features/navigation/domain/entity/app_route_paths.dart';
import 'package:rick_and_morty/features/navigation/domain/entity/debug/debug_routes.dart';
import 'package:rick_and_morty/features/temp/screens/temp_screen/temp_screen_export.dart';

/// All routes for the temp feature.
const tempRoutes = AutoRoute<dynamic>(
  initial: true,
  path: AppRoutePaths.tempPath,
  name: AppRouteNames.tempScreen,
  page: EmptyRouterPage,
  children: [
    AutoRoute<dynamic>(
      page: TempScreen,
    ),
    debugRoutes,
  ],
);
