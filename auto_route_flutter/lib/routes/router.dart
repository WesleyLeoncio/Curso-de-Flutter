

import 'package:auto_route/auto_route.dart';

import '../screens/home.dart';
import '../screens/pg1.dart';
import '../screens/pg2.dart';
import '../screens/pg3.dart';


@MaterialAutoRouter(replaceInRouteName: 'Page, Route',
routes: <AutoRoute>[
  AutoRoute(page: Home, initial: true),
  AutoRoute(page: Pg1),
  AutoRoute(page: Pg2),
  AutoRoute(page: Pg3),
])
class $AppRouter {}