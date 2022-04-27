// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../modulo_teste/route/settings_route_pg3.dart' as _i5;
import '../modulo_teste/screens/pg3.dart' as _i4;
import '../modulo_teste/screens/pg4.dart' as _i6;
import '../modulo_teste/screens/pg5.dart' as _i7;
import '../screens/home.dart' as _i1;
import '../screens/pg1.dart' as _i2;
import '../screens/pg2.dart' as _i3;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    Home.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Home());
    },
    Pg1.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.Pg1());
    },
    Pg2.name: (routeData) {
      final args = routeData.argsAs<Pg2Args>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.Pg2(key: args.key, name: args.name));
    },
    Pg3.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.Pg3());
    },
    SettingsRouterPg3.name: (routeData) {
      final args = routeData.argsAs<SettingsRouterPg3Args>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.SettingsRoutePg3(key: args.key, titulo: args.titulo));
    },
    Pg4.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.Pg4());
    },
    Pg5.name: (routeData) {
      final args = routeData.argsAs<Pg5Args>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.Pg5(key: args.key, name: args.name));
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(Home.name, path: '/'),
        _i8.RouteConfig(Pg1.name, path: '/Pg1'),
        _i8.RouteConfig(Pg2.name, path: '/Pg2'),
        _i8.RouteConfig(Pg3.name, path: '/Pg3'),
        _i8.RouteConfig(SettingsRouterPg3.name,
            path: '/settingsPg3',
            children: [
              _i8.RouteConfig(Pg4.name,
                  path: 'pg4', parent: SettingsRouterPg3.name),
              _i8.RouteConfig(Pg5.name,
                  path: 'pg5', parent: SettingsRouterPg3.name)
            ])
      ];
}

/// generated route for
/// [_i1.Home]
class Home extends _i8.PageRouteInfo<void> {
  const Home() : super(Home.name, path: '/');

  static const String name = 'Home';
}

/// generated route for
/// [_i2.Pg1]
class Pg1 extends _i8.PageRouteInfo<void> {
  const Pg1() : super(Pg1.name, path: '/Pg1');

  static const String name = 'Pg1';
}

/// generated route for
/// [_i3.Pg2]
class Pg2 extends _i8.PageRouteInfo<Pg2Args> {
  Pg2({_i9.Key? key, required String name})
      : super(Pg2.name, path: '/Pg2', args: Pg2Args(key: key, name: name));

  static const String name = 'Pg2';
}

class Pg2Args {
  const Pg2Args({this.key, required this.name});

  final _i9.Key? key;

  final String name;

  @override
  String toString() {
    return 'Pg2Args{key: $key, name: $name}';
  }
}

/// generated route for
/// [_i4.Pg3]
class Pg3 extends _i8.PageRouteInfo<void> {
  const Pg3() : super(Pg3.name, path: '/Pg3');

  static const String name = 'Pg3';
}

/// generated route for
/// [_i5.SettingsRoutePg3]
class SettingsRouterPg3 extends _i8.PageRouteInfo<SettingsRouterPg3Args> {
  SettingsRouterPg3(
      {_i9.Key? key, required String titulo, List<_i8.PageRouteInfo>? children})
      : super(SettingsRouterPg3.name,
            path: '/settingsPg3',
            args: SettingsRouterPg3Args(key: key, titulo: titulo),
            initialChildren: children);

  static const String name = 'SettingsRouterPg3';
}

class SettingsRouterPg3Args {
  const SettingsRouterPg3Args({this.key, required this.titulo});

  final _i9.Key? key;

  final String titulo;

  @override
  String toString() {
    return 'SettingsRouterPg3Args{key: $key, titulo: $titulo}';
  }
}

/// generated route for
/// [_i6.Pg4]
class Pg4 extends _i8.PageRouteInfo<void> {
  const Pg4() : super(Pg4.name, path: 'pg4');

  static const String name = 'Pg4';
}

/// generated route for
/// [_i7.Pg5]
class Pg5 extends _i8.PageRouteInfo<Pg5Args> {
  Pg5({_i9.Key? key, required String name})
      : super(Pg5.name, path: 'pg5', args: Pg5Args(key: key, name: name));

  static const String name = 'Pg5';
}

class Pg5Args {
  const Pg5Args({this.key, required this.name});

  final _i9.Key? key;

  final String name;

  @override
  String toString() {
    return 'Pg5Args{key: $key, name: $name}';
  }
}
