/// 🏗️ Base Page State - Base class cho tất cả screens
///
/// Cung cấp:
/// - Auto DI injection cho BLoCs
/// - Exception handling chung
/// - Loading overlay management
/// - Navigation và logging utilities
/// - Common UI patterns

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shared/shared.dart';
import 'package:domain/domain.dart';
import 'bloc/base_bloc.dart';
import 'bloc/app_bloc.dart';
import 'bloc/common/common_bloc.dart';
import 'bloc/common/common_state.dart';
import 'exception_handler/exception_handler.dart';
import 'exception_handler/exception_message_mapper.dart';

/// Base state với logging mixin
abstract class BasePageState<T extends StatefulWidget, B extends BaseBloc>
    extends BasePageStateDelegate<T, B>
    with LogMixin {}

/// Core base state implementation
abstract class BasePageStateDelegate<
  T extends StatefulWidget,
  B extends BaseBloc
>
    extends State<T>
    with LogMixin
    implements ExceptionHandlerListener {
  late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();
  late final AppBloc appBloc = GetIt.instance.get<AppBloc>();
  late final ExceptionMessageMapper exceptionMessageMapper =
      const ExceptionMessageMapper();
  late final ExceptionHandler exceptionHandler = ExceptionHandler(
    navigator: navigator,
    listener: this,
  );

  late final CommonBloc commonBloc =
      GetIt.instance.get<CommonBloc>()
        ..navigator = navigator
        ..disposeBag = disposeBag
        ..appBloc = appBloc
        ..exceptionHandler = exceptionHandler
        ..exceptionMessageMapper = exceptionMessageMapper;

  late final B bloc =
      GetIt.instance.get<B>()
        ..navigator = navigator
        ..disposeBag = disposeBag
        ..appBloc = appBloc
        ..commonBloc = commonBloc
        ..exceptionHandler = exceptionHandler
        ..exceptionMessageMapper = exceptionMessageMapper;

  late final DisposeBag disposeBag = DisposeBag();

  bool get isAppWidget => false;

  /// Access to localization throughout the app
  AppLocalizations get l10n => AppLocalizations.of(context)!;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => navigator,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => bloc),
          BlocProvider(create: (_) => commonBloc),
        ],
        child: BlocListener<CommonBloc, CommonState>(
          listenWhen:
              (previous, current) =>
                  previous.appExceptionWrapper != current.appExceptionWrapper &&
                  current.appExceptionWrapper != null,
          listener: (context, state) {
            handleException(state.appExceptionWrapper!);
          },
          child: buildPageListeners(
            child:
                isAppWidget
                    ? buildPage(context)
                    : Stack(
                      children: [
                        buildPage(context),
                        BlocBuilder<CommonBloc, CommonState>(
                          buildWhen:
                              (previous, current) =>
                                  previous.isLoading != current.isLoading,
                          builder:
                              (context, state) => Visibility(
                                visible: state.isLoading,
                                child: buildPageLoading(),
                              ),
                        ),
                      ],
                    ),
          ),
        ),
      ),
    );
  }

  Widget buildPageListeners({required Widget child}) => child;

  Widget buildPageLoading() => const Center(child: CircularProgressIndicator());

  Widget buildPage(BuildContext context);

  @override
  void dispose() {
    super.dispose();
    disposeBag.dispose();
  }

  void handleException(AppExceptionWrapper appExceptionWrapper) {
    exceptionHandler
        .handleException(
          appExceptionWrapper,
          handleExceptionMessage(appExceptionWrapper.appException),
        )
        .then((value) {
          appExceptionWrapper.exceptionCompleter?.complete();
        });
  }

  String handleExceptionMessage(AppException appException) {
    return exceptionMessageMapper.map(appException);
  }

  @override
  void onRefreshTokenFailed() {
    // Handle refresh token failure
    logI('Refresh token failed');
  }
}
