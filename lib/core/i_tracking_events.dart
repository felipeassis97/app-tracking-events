import 'package:app_tracking_events/core/i_tracking_analytics.dart';
import 'package:app_tracking_events/core/i_tracking_crashlytics.dart';

/// ℹ️ __You should use some of the available providers__
/// - You can create an instance like this:
///   ```dart
///   final ITrackingEvents logger = FirebaseMethod(firebaseOptions: ...);
///   ```
///   - ___Obs.:__ In the example above, the [FirebaseMethod] is being displayed, but you can use any method available in the library_
///
/// - You can create an instance using Get It or another dependency manager like this:
///   ```dart
///   getIt.registerLazySingleton<ITrackingEvents>(FirebaseMethod(ferebaseOptions: ...));
///   ```
/// - #### Functions available
///   - __Analytics__
///     * logEvents
///     * logSignin
///     * logSignout
///     * logSignUp
///     * logAppOpen.
///     * resetAllDeviceData
///   - __Crashlytics__
///     * recordError
///     * recordNetworkError
abstract class ITrackingEvents {
  final ITrackingAnalytics analytics;
  final ITrackingCrashlytics crashlytics;

  const ITrackingEvents({
    required this.analytics,
    required this.crashlytics,
  });
}
