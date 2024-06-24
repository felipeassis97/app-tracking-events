import 'package:firebase_core/firebase_core.dart';
import 'package:app_tracking_events/core/i_tracking_events.dart';
import 'package:app_tracking_events/core/i_tracking_analytics.dart';
import 'package:app_tracking_events/core/i_tracking_crashlytics.dart';
import 'package:app_tracking_events/methods/firebase/tracking_firebase_analytics.dart';
import 'package:app_tracking_events/methods/firebase/tracking_firebase_crashlytics.dart';

class FirebaseMethod implements ITrackingEvents {
  final FirebaseOptions firebaseOptions;

  FirebaseMethod({required this.firebaseOptions}) {
    initialize();
  }

  Future<void> initialize() async {
    await Firebase.initializeApp(options: firebaseOptions);
  }

  @override
  ITrackingAnalytics get analytics => TrackingFirebaseAnalytics();

  @override
  ITrackingCrashlytics get crashlytics => TrackingFirebaseCrashlytics();
}
