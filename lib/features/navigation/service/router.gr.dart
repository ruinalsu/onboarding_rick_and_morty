// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: CharactersScreen(key: args.key, vmFactory: args.vmFactory));
    }
  };

  @override
  List<RouteConfig> get routes => [RouteConfig(HomeRoute.name, path: '/')];
}

/// generated route for
/// [CharactersScreen]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute(
      {Key? key,
      WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
              BuildContext)
          vmFactory = initCharactersScreenWMFactory})
      : super(HomeRoute.name,
            path: '/', args: HomeRouteArgs(key: key, vmFactory: vmFactory));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs(
      {this.key, this.vmFactory = initCharactersScreenWMFactory});

  final Key? key;

  final WidgetModel<ElementaryWidget<IWidgetModel>, ElementaryModel> Function(
      BuildContext) vmFactory;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, vmFactory: $vmFactory}';
  }
}
