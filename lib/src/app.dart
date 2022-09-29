import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../resources/app_config.dart';
import 'base/settings/di/theme_providers.dart';
import 'base/settings/ui/viewmodel/theme_viewmodel.dart';
import 'base/token/di/token_providers.dart';
import 'base/widget/ui/custom_circular_progress_indicator.dart';
import 'start/di/start_page_providers.dart';
import 'start/ui/navigator/start_page_navigator.dart';

void mainCommon({required String host, required bool isProd}) async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }
  final prefs = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      MultiProvider(
        providers: themePageProviders(prefs),
        builder: (context, __) {
          final themeViewModel = context.watch<ThemeViewModel>();
          return App(
            host: host,
            isProd: isProd,
            themeViewModel: themeViewModel,
          );
        },
      ),
    ),
  );
}

class App extends StatefulWidget {
  final String host;
  final bool isProd;
  final ThemeViewModel? themeViewModel;

  App({
    required this.host,
    required this.isProd,
    this.themeViewModel,
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    widget.themeViewModel!.setInitialTheme();
    super.initState();
  }

  final Future<SharedPreferences> _initialization = Firebase.initializeApp().then((value) async {
    if (!kIsWeb) {
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    }
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder<SharedPreferences>(
          // Initialize FlutterFire:
          future: _initialization,
          builder: (context, snapshot) {
            // Check for errors
            if (snapshot.connectionState == ConnectionState.done || snapshot.hasError) {
              if (kDebugMode && snapshot.connectionState == ConnectionState.done && !kIsWeb) {
                FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
              }
              return _App(
                host: this.widget.host,
                isProd: this.widget.isProd,
              );
            }
            return CustomCircularProgressIndicator(
              color: Colors.white,
            );
          },
        ),
      ),
    );
  }
}

class _App extends StatefulWidget {
  // This widget is the root of your application.

  final String host;
  final bool isProd;

  _App({
    required this.host,
    required this.isProd,
  });

  @override
  __AppState createState() => __AppState();
}

class __AppState extends State<_App> {
  @override
  Widget build(BuildContext context) {
    final themeViewModel = Provider.of<ThemeViewModel>(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: _ScrollBehaviour(),
          child: child!,
        );
      },
      localizationsDelegates: [
        DefaultWidgetsLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale.fromSubtags(languageCode: 'it'), // generic italian
        const Locale.fromSubtags(languageCode: 'en') // generic english
      ],
      //Apps based on WidgetsApp are similar except that the GlobalMaterialLocalizations.delegate isn’t needed
      title: '%APPNAME%',
      theme: themeViewModel.userTheme!,
      home: MultiProvider(
        providers: [
          Provider(
            create: (context) => AppConfig(host: widget.host, isProd: widget.isProd),
          ),
          ...tokenProviders,
          ...startPageProviders,
        ],
        child: StartPageNavigator(),
      ),
    );
  }
}

class _ScrollBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
