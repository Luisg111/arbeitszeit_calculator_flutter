import 'package:arbeitszeit_calculator_flutter/navigation/route_observer.dart';
import 'package:go_router/go_router.dart';

import 'app_navigation.dart';

final GoRouter router = GoRouter(
  routes: $appRoutes,
  //observers: [routeObserver],
);
