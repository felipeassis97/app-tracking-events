import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:app_tracking_events/core/i_tracking_analytics.dart';

class TrackingFirebaseAnalytics implements ITrackingAnalytics {
  late final FirebaseAnalytics _analytics;

  TrackingFirebaseAnalytics() {
    _analytics = FirebaseAnalytics.instance;
  }

  @override
  Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
  }) async {
    await _analytics.logEvent(name: name, parameters: parameters);
  }

  @override
  Future<void> logAppOpen(Map<String, Object>? parameters) async {
    await _analytics.logAppOpen(parameters: parameters);
  }

  @override
  Future<void> logSignIn({
    required String loginMethod,
    Map<String, Object>? parameters,
  }) async {
    await _analytics.logLogin(loginMethod: loginMethod, parameters: parameters);
  }

  @override
  Future<void> logSignUp({
    required String signUpMethod,
    Map<String, Object>? parameters,
  }) async {
    await _analytics.logSignUp(
        signUpMethod: signUpMethod, parameters: parameters);
  }

  @override
  Future<void> resetAllDeviceData() async {
    await _analytics.resetAnalyticsData();
  }

  @override
  Future<void> logSignOut({
    Map<String, Object>? parameters,
  }) async {
    await _analytics.logEvent(name: 'Signout', parameters: parameters);
  }
}
