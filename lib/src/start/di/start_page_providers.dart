import 'package:baseproject/src/base/settings/di/theme_providers.dart';
import 'package:baseproject/src/base/token/di/token_providers.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../resources/app_config.dart';
import '../../base/network/dio_provider.dart';
import '../../base/network/token_incerceptor.dart';
import '../../base/settings/ui/viewmodel/theme_viewmodel.dart';
import '../../base/token/domain/token_repository.dart';
import '../ui/viewmodel/start_page_view_model_main.dart';

final dioProvider = Provider<Dio>((ref) {
  AppConfig appConfig = ref.watch(appConfigProviders!);
  TokenInterceptor tokenInterceptor = ref.watch(tokenInterceptorProvider);
  return provideDio(
    appConfig: appConfig,
    interceptors: [LogInterceptor(), tokenInterceptor],
  );
});

///Initted on startup
Provider<SharedPreferences>? preferencesProvider;

///Initted on startup
Provider<AppConfig>? appConfigProviders;

final startViewModelProvider = ChangeNotifierProvider<StartPageViewModelMain>((ref) {
  TokenRepository tokenRepository = ref.watch(tokenRepositoryProvider);
  ThemeViewModel themeViewModel = ref.watch(themeViewModelProvider);
  return StartPageViewModelMain()..update(FirebaseMessaging.instance, Firebase.app(), tokenRepository, themeViewModel);
});
