import 'package:app_tracking_events/core/i_tracking_analytics.dart';
import 'package:app_tracking_events/core/i_tracking_crashlytics.dart';

/// You should use some of the available providers
/// You can create an instance like this:
///```dart
/// final ISearsLogger logger = FirebaseMethod(firebaseOptions: ...);
/// ```
/// ___Obs.:__ In the example above, the __FirebaseMethod__ is being displayed, but you can use any method available in the library_
///
/// You can create an instance using Get It or another dependency managerlike this:
/// ```dart
///   getIt.registerLazySingleton<ISearsLogger>(FirebaseMethod(ferebaseOptions: ...));
/// ```
/// - Functions available
///   - Analytics
///     * logEvents
///     * logSignin
///     * logSignout
///     * logSignUp
///     * logAppOpen.
///     * resetAllDeviceData
///   - Crashlytics
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