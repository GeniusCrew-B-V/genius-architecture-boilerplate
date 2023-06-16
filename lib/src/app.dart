import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../resources/app_config.dart';
import 'base/settings/di/theme_providers.dart';
import 'base/settings/ui/viewmodel/theme_viewmodel.dart';
import 'base/widget/ui/custom_circular_progress_indicator.dart';
import 'start/di/start_page_providers.dart';
import 'start/ui/navigator/start_page_navigator.dart';

void mainCommon({required String host, required bool isProd}) async {
  ///Main initialization
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  ///Set fastest refreshRate (Smooth is better)
  await FlutterDisplayMode.setHighRefreshRate();

  ///Set up appConfig
  appConfigProviders ??= Provider<AppConfig>((ref) => AppConfig(host: host, isProd: isProd));

  ///Set orientation and run app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      ProviderScope(
        child: App(),
      ),
    ),
  );
}

class App extends ConsumerWidget {
  final Future<SharedPreferences> _initialization = Firebase.initializeApp().then((value) async {
    if (!kIsWeb) {
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    }
    final prefs = await SharedPreferences.getInstance();
    preferencesProvider = Provider<SharedPreferences>((ref) => prefs);
    return prefs;
  });

  @override
  Widget build(BuildContext context, ref) {
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
              return _App();
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

class _App extends ConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    ThemeViewModel viewModel = ref.watch(themeViewModelProvider);
    return MaterialApp(
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
      theme: viewModel.userTheme!,
      home: StartPageNavigator(),
    );
  }
}
