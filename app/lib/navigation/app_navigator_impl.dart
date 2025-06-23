import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart' as m;
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

import 'base/base_popup_info_mapper.dart';
import 'base/base_route_info_mapper.dart';
import 'routes/app_router.dart';

@LazySingleton(as: AppNavigator)
class AppNavigatorImpl extends AppNavigator with LogMixin {
  AppNavigatorImpl(
    this._appRouter,
    this._appPopupInfoMapper,
    this._appRouteInfoMapper,
  );

  final AppRouter _appRouter;
  final BasePopupInfoMapper _appPopupInfoMapper;
  final BaseRouteInfoMapper _appRouteInfoMapper;
  final _shownPopups = <AppPopupInfo, Completer<dynamic>>{};

  m.BuildContext get _rootRouterContext =>
      _appRouter.navigatorKey.currentContext!;

  @override
  bool get canPopSelfOrChildren => _appRouter.canPop();

  @override
  String getCurrentRouteName({bool useRootNavigator = false}) =>
      AutoRouter.of(_rootRouterContext).current.name;

  @override
  Future<T?> push<T extends Object?>(AppRouteInfo appRouteInfo) {
    logD('push $appRouteInfo');
    return _appRouter.push<T>(_appRouteInfoMapper.map(appRouteInfo));
  }

  @override
  Future<T?> replace<T extends Object?>(AppRouteInfo appRouteInfo) {
    _shownPopups.clear();
    logD('replace by $appRouteInfo');
    return _appRouter.replace<T>(_appRouteInfoMapper.map(appRouteInfo));
  }

  @override
  Future<bool> pop<T extends Object?>({
    T? result,
    bool useRootNavigator = false,
  }) {
    logD('pop with result = $result, useRootNav = $useRootNavigator');
    _appRouter.pop<T>(result);
    return Future.value(true);
  }

  @override
  Future<T?> popAndPush<T extends Object?, R extends Object?>(
    AppRouteInfo appRouteInfo, {
    R? result,
    bool useRootNavigator = false,
  }) {
    logD(
      'popAndPush $appRouteInfo with result = $result, useRootNav = $useRootNavigator',
    );
    return _appRouter.popAndPush<T, R>(
      _appRouteInfoMapper.map(appRouteInfo),
      result: result,
    );
  }

  @override
  void popUntilRoot({bool useRootNavigator = false}) {
    logD('popUntilRoot, useRootNav = $useRootNavigator');
    _appRouter.popUntilRoot();
  }

  @override
  void popUntilRouteName(String routeName) {
    logD('popUntilRouteName $routeName');
    _appRouter.popUntilRouteWithName(routeName);
  }

  @override
  bool removeUntilRouteName(String routeName) {
    logD('removeUntilRouteName $routeName');
    return _appRouter.removeUntil((route) => route.name == routeName);
  }

  @override
  bool removeAllRoutesWithName(String routeName) {
    logD('removeAllRoutesWithName $routeName');
    return _appRouter.removeWhere((route) => route.name == routeName);
  }

  @override
  bool removeLast() {
    logD('removeLast');
    return _appRouter.removeLast();
  }

  @override
  Future<T?> showDialog<T extends Object?>(
    AppPopupInfo appPopupInfo, {
    bool barrierDismissible = true,
    bool useSafeArea = false,
    bool useRootNavigator = true,
  }) {
    if (_shownPopups.containsKey(appPopupInfo)) {
      logD('Dialog $appPopupInfo already shown');
      return _shownPopups[appPopupInfo]!.future.then((value) => value as T?);
    }
    _shownPopups[appPopupInfo] = Completer<T?>();

    return m.showDialog<T>(
      context: _rootRouterContext,
      builder:
          (_) => m.PopScope(
            onPopInvokedWithResult: (didPop, result) {
              if (didPop) {
                logD('Dialog $appPopupInfo dismissed');
                _shownPopups.remove(appPopupInfo);
              }
            },
            child: _appPopupInfoMapper.map(appPopupInfo, this),
          ),
      useRootNavigator: useRootNavigator,
      barrierDismissible: barrierDismissible,
      useSafeArea: useSafeArea,
    );
  }

  @override
  void showErrorSnackBar(String message, {Duration? duration}) {
    _showSnackBar(message, duration: duration, backgroundColor: m.Colors.red);
  }

  @override
  void showSuccessSnackBar(String message, {Duration? duration}) {
    _showSnackBar(message, duration: duration, backgroundColor: m.Colors.green);
  }

  void _showSnackBar(
    String message, {
    Duration? duration,
    m.Color? backgroundColor,
  }) {
    final messengerState = m.ScaffoldMessenger.maybeOf(_rootRouterContext);
    if (messengerState == null) {
      return;
    }
    messengerState.hideCurrentSnackBar();
    messengerState.showSnackBar(
      m.SnackBar(
        content: m.Text(message),
        duration: duration ?? const Duration(seconds: 2),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
