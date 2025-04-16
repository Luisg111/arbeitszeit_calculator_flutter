// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_navigation.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$homeRoute, $shellRoute];

RouteBase get $homeRoute =>
    GoRouteData.$route(path: '/', factory: $HomeRouteExtension._fromState);

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location('/');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $shellRoute => ShellRouteData.$route(
  observers: ShellRoute.$observers,
  factory: $ShellRouteExtension._fromState,
  routes: [
    GoRouteData.$route(
      path: '/shifts',

      factory: $ShiftListRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'create',

          factory: $ShiftCreateRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'icalImport',

          factory: $ShiftIcalImportRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'id/:id',

          factory: $ShiftDetailsRouteExtension._fromState,
        ),
      ],
    ),
  ],
);

extension $ShellRouteExtension on ShellRoute {
  static ShellRoute _fromState(GoRouterState state) => const ShellRoute();
}

extension $ShiftListRouteExtension on ShiftListRoute {
  static ShiftListRoute _fromState(GoRouterState state) =>
      const ShiftListRoute();

  String get location => GoRouteData.$location('/shifts');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ShiftCreateRouteExtension on ShiftCreateRoute {
  static ShiftCreateRoute _fromState(GoRouterState state) =>
      const ShiftCreateRoute();

  String get location => GoRouteData.$location('/shifts/create');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ShiftIcalImportRouteExtension on ShiftIcalImportRoute {
  static ShiftIcalImportRoute _fromState(GoRouterState state) =>
      const ShiftIcalImportRoute();

  String get location => GoRouteData.$location('/shifts/icalImport');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ShiftDetailsRouteExtension on ShiftDetailsRoute {
  static ShiftDetailsRoute _fromState(GoRouterState state) =>
      ShiftDetailsRoute(int.parse(state.pathParameters['id']!)!);

  String get location =>
      GoRouteData.$location('/shifts/id/${Uri.encodeComponent(id.toString())}');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
