import 'package:flutter/foundation.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:app_tracking_events/core/i_tracking_crashlytics.dart';

class TrackingFirebaseCrashlytics implements ITrackingCrashlytics {
  late final FirebaseCrashlytics _crashlytics;

  TrackingFirebaseCrashlytics() {
    _crashlytics = FirebaseCrashlytics.instance;

    /// Setup automatic detection of fatal errors in app
    FlutterError.onError = _crashlytics.recordFlutterFatalError;

    /// Setup automatic detection of async errors
    PlatformDispatcher.instance.onError = (exception, stackTrace) {
      _crashlytics.recordError(exception, stackTrace, fatal: true);
      return true;
    };
  }

  @override
  Future<void> recordError(
      {required Object error,
      StackTrace? stackTrace,
      String? reason,
      Iterable<Object> information = const [],
      bool isFatal = false}) async {
    await _crashlytics.recordError(
      error,
      stackTrace,
      reason: reason,
      information: information,
      fatal: isFatal,
    );
  }

  @override
  Future<void> recordNetworkError(
      {required Object error,
      required String url,
      required String httpMethod,
      required int startTime,
      required int endTime,
      required StackTrace stackTrace,
      Map<String, dynamic>? response,
      bool isFatal = false}) async {
    await _crashlytics.recordError(
      error,
      stackTrace,
      information: [
        {
          'url': url,
          'httpMethod': httpMethod,
          'startTime': startTime,
          'endTime': endTime,
          'response': response,
        }
      ],
      fatal: isFatal,
    );
  }
}
