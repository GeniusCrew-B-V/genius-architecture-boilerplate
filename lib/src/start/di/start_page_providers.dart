import 'package:baseproject/i18n/translations.dart';
import 'package:baseproject/src/base/analytics/google_analytics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../resources/app_config.dart';
import '../../base/network/dio_provider.dart';
import '../../base/network/token_incerceptor.dart';
import '../../base/settings/ui/viewmodel/theme_viewmodel.dart';
import '../../base/token/domain/token_repository.dart';
import '../ui/viewmodel/start_page_view_model_main.dart';

List<SingleChildWidget> startPageProviders = [
  ..._independentServices,
  ..._dependentServices,
];

List<SingleChildWidget> _independentServices = [
  Provider(
    create: (context) => FirebaseMessaging.instance,
  ),
  Provider(
    create: (context) => Firebase.app(),
  ),
  Provider(
    create: (context) => FlutterLocalNotificationsPlugin(),
  ),
  Provider(create: (context) => FirebaseAnalytics.instance),
];

List<SingleChildWidget> _dependentServices = [
  ProxyProvider<FirebaseAnalytics, GoogleAnalytics>(
      update: (context, analytics, _) => GoogleAnalytics(analytics)),
  ProxyProvider0(
    update: (context, _) {
      return AndroidNotificationChannel(
        'default_channel', // id
        translation.generic.notificationDefaultChannel, // title
        description: translation
            .generic.notificationDescriptionDefaultChannel, // description
        importance: Importance.defaultImportance,
      );
    },
  ),
  ProxyProvider0<FirebaseFirestore>(
      update: (_, __) => FirebaseFirestore.instance),
  ProxyProvider0<Dio>(update: (_, __) => Dio()),
  ProxyProvider2<AppConfig, TokenInterceptor, Dio>(
    update: (context, appConfig, tokenInterceptor, previous) => provideDio(
      appConfig: appConfig,
      interceptors: [LogInterceptor(), tokenInterceptor],
    ),
  ),
  ChangeNotifierProxyProvider6<
      FirebaseMessaging,
      FirebaseApp,
      TokenRepository,
      FlutterLocalNotificationsPlugin,
      AndroidNotificationChannel,
      ThemeViewModel,
      StartPageViewModelMain?>(
    create: (context) => StartPageViewModelMain(),
    update: (
      context,
      firebaseMessaging,
      firebaseApp,
      tokenRepository,
      flutterLocalNotificationsPlugin,
      channel,
      themeViewModel,
      previous,
    ) =>
        previous!
          ..update(
            context,
            firebaseMessaging,
            firebaseApp,
            tokenRepository,
            themeViewModel,
          ),
  ),
];
