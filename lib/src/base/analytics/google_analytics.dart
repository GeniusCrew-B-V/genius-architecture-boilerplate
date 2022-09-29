import 'package:firebase_analytics/firebase_analytics.dart';

import 'google_analytics_constants.dart';

class GoogleAnalytics {
  FirebaseAnalytics _analytics;

  GoogleAnalytics(this._analytics);

  void setCurrentScreen(String screenName) {
    try {
      _analytics.setCurrentScreen(screenName: screenName);
    } catch (error) {
      print(error);
    }
  }

  void setReportNumber(int number) {
    try {
      String value = '';
      value = '$number';
      _analytics.setUserProperty(
          name: GAnalyticsUserProperties.REPORT_NUMBER, value: value);
    } catch (error) {
      print(error);
    }
  }

  void logEvent(String name, Map<String, String> parameters) {
    try {
      _analytics.logEvent(name: name, parameters: parameters);
    } catch (error) {
      print(error);
    }
  }
}
