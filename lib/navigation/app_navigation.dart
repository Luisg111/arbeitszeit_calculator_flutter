import 'package:arbeitszeit_calculator_flutter/navigation/basic_page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../feature/shift/presentation/shift_details/view/shift_details_screen.dart';
import '../feature/shift/presentation/shift_ical_import/view/shift_ical_import_screen.dart';
import '../feature/shift/presentation/shift_list/view/shift_list_screen.dart';


part "app_navigation.g.dart";

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  String? redirect(BuildContext context, GoRouterState state) {
    return const ShiftListRoute().location;
  }
}

@TypedShellRoute<ShellRoute>(
  routes: [
    TypedGoRoute<ShiftListRoute>(
      path: '/shifts',
      routes: [
        TypedGoRoute<ShiftCreateRoute>(path: "create"),
        TypedGoRoute<ShiftIcalImportRoute>(path: "icalImport"),
        TypedGoRoute<ShiftDetailsRoute>(path: "id/:id"),
      ],
    ),
  ],
)
class ShellRoute extends ShellRouteData {
  const ShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return BasicPage(child: navigator);
  }
}

class ShiftListRoute extends GoRouteData {
  const ShiftListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ShiftListScreen();
}

class ShiftCreateRoute extends GoRouteData {
  const ShiftCreateRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ShiftDetailsScreen();
}

class ShiftIcalImportRoute extends GoRouteData {
  const ShiftIcalImportRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ShiftIcalImportScreen();
}

class ShiftDetailsRoute extends GoRouteData {
  const ShiftDetailsRoute(this.id);

  final int id;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ShiftDetailsScreen(id: id);
}
