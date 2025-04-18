import "package:arbeitszeit_calculator_flutter/navigation/app_navigation.dart";
import "package:go_router/go_router.dart";

final GoRouter router = GoRouter(
  routes: $appRoutes,
  //observers: [routeObserver],
);
