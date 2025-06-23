import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:initializer/initializer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'base/base_page_state.dart';
import 'base/bloc/app_bloc.dart';
import 'base/bloc/app_event.dart';
import 'base/bloc/app_state.dart';
import 'config/app_config.dart';
import 'navigation/routes/app_router.dart';
import 'navigation/observer/app_navigator_observer.dart';
import 'resource/theme/weather_theme.dart';
import 'resource/dimens/app_dimen.dart';
import 'package:shared/shared.dart';

const String _flavor = String.fromEnvironment(
  'FLAVOR',
  defaultValue: 'develop',
);

void main() => runZonedGuarded(_runMyApp, _reportError);

Future<void> _runMyApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await AppInitializer(AppConfig.getInstance()).init();
  runApp(MyApp(flavor: _flavor));
}

void _reportError(Object error, StackTrace stackTrace) {
  Log.e(error, stackTrace: stackTrace, name: 'Uncaught exception');

  // report by Firebase Crashlytics here
}

class MyApp extends StatelessWidget {
  final String flavor;
  const MyApp({super.key, required this.flavor});

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});
  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends BasePageState<AppView, AppBloc> {
  final _appRouter = GetIt.instance.get<AppRouter>();

  @override
  bool get isAppWidget => true; // This is the main app widget

  @override
  void initState() {
    super.initState();
    // Initialize the app
    bloc.add(const AppEvent.initiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    // Initialize AppDimen for responsive design
    AppDimen.of(context);

    return BlocBuilder<AppBloc, AppState>(
      builder: (context, appState) {
        return ScreenUtilInit(
          designSize: const Size(375, 812), // iPhone X design size
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              title: 'Weather App',
              theme: WeatherTheme.lightTheme,
              darkTheme: WeatherTheme.darkTheme,
              themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
              locale: Locale(appState.locale),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              routerDelegate: _appRouter.delegate(
                navigatorObservers: () => [AppNavigatorObserver()],
              ),
              routeInformationParser: _appRouter.defaultRouteParser(),
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}
