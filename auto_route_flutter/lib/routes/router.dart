

import 'package:auto_route/auto_route.dart';
import 'package:auto_route_flutter/modulo_teste/route/settings_route_pg3.dart';


import '../screens/home.dart';
import '../screens/pg1.dart';
import '../screens/pg2.dart';
import '../modulo_teste/screens/pg3.dart';



@MaterialAutoRouter(replaceInRouteName: 'Page, Route',
routes: <AutoRoute>[
  AutoRoute(page: Home, initial: true),
  AutoRoute(page: Pg1,),
  AutoRoute(page: Pg2),
  AutoRoute(page: Pg3),
  routesPg3,

])
class $AppRouter {}

