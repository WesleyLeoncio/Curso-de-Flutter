// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../screens/home.dart' as _i1;
import '../screens/pg1.dart' as _i2;
import '../screens/pg2.dart' as _i3;
import '../screens/pg3.dart' as _i4;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    Home.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Home());
    },
    Pg1.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.Pg1());
    },
    Pg2.name: (routeData) {
      final args = routeData.argsAs<Pg2Args>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.Pg2(key: args.key, name: args.name));
    },
    Pg3.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.Pg3());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(Home.name, path: '/'),
        _i5.RouteConfig(Pg1.name, path: '/Pg1'),
        _i5.RouteConfig(Pg2.name, path: '/Pg2'),
        _i5.RouteConfig(Pg3.name, path: '/Pg3')
      ];
}

/// generated route for
/// [_i1.Home]
class Home extends _i5.PageRouteInfo<void> {
  const Home() : super(Home.name, path: '/');

  static const String name = 'Home';
}

/// generated route for
/// [_i2.Pg1]
class Pg1 extends _i5.PageRouteInfo<void> {
  const Pg1() : super(Pg1.name, path: '/Pg1');

  static const String name = 'Pg1';
}

/// generated route for
/// [_i3.Pg2]
class Pg2 extends _i5.PageRouteInfo<Pg2Args> {
  Pg2({_i6.Key? key, required String name})
      : super(Pg2.name, path: '/Pg2', args: Pg2Args(key: key, name: name));

  static const String name = 'Pg2';
}

class Pg2Args {
  const Pg2Args({this.key, required this.name});

  final _i6.Key? key;

  final String name;

  @override
  String toString() {
    return 'Pg2Args{key: $key, name: $name}';
  }
}

/// generated route for
/// [_i4.Pg3]
class Pg3 extends _i5.PageRouteInfo<void> {
  const Pg3() : super(Pg3.name, path: '/Pg3');

  static const String name = 'Pg3';
}
