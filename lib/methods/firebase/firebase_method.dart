import 'package:firebase_core/firebase_core.dart';
import 'package:app_tracking_events/core/i_tracking_events.dart';
import 'package:app_tracking_events/core/i_tracking_analytics.dart';
import 'package:app_tracking_events/core/i_tracking_crashlytics.dart';
import 'package:app_tracking_events/methods/firebase/tracking_firebase_analytics.dart';
import 'package:app_tracking_events/methods/firebase/credentials/firebase_options.dart';
import 'package:app_tracking_events/methods/firebase/tracking_firebase_crashlytics.dart';
import 'package:app_tracking_events/methods/firebase/credentials/firebase_credentials.dart';

/// ### 🔸 DebugView for Analytics
/// Typically, the events recorded by your application are batched over a period of approximately one hour and uploaded together.
/// However, for validation purposes of your Analytics implementation, you can enable __DebugView__.
/// #### 📱 Android
/// > - To enable Analytics debug mode on an Android device, execute the following commands:
///      - ```shell
///          adb shell setprop debug.firebase.analytics.app PACKAGE_NAME
///       ```
/// > - This behavior persists until you explicitly disable debug mode by executing the following command:
///      - ```shell
///         adb shell setprop debug.firebase.analytics.app .none.
///       ```
/// &nbsp;
/// #### 📱 iOS
/// > - To enable Analytics debug mode on your development device, specify the following command line argument in Xcode: ```-FIRDebugEnabled```
/// > - This behavior persists until you explicitly disable debug mode by specifying the following command line argument: ```-FIRDebugDisabled```
/// #### __For more informations,__ [Consult the official documentation  🔗 ](https://firebase.google.com/docs/analytics/debugview#ios+)
/// ---
/// ### 🔸 Enable debug logging for Crashlytics
/// #### 📱 Android
/// > - Before running your app, set the following adb shell flag to __DEBUG__:
///      - ```shell
///          adb shell setprop log.tag.FirebaseCrashlytics DEBUG
///       ```
/// > - View the logs in your device logs by running the following command:
///      - ```shell
///          adb logcat -s FirebaseCrashlytics
///       ```
/// > - After confirming that your app is sending crashes, you can optionally disable debug logging by setting the adb shell flag back to INFO:
///      - ```shell
///          adb shell setprop log.tag.FirebaseCrashlytics INFO
///       ```
/// &nbsp;
/// #### 📱 iOS
/// > - Enable debug logging:
///      - In Xcode, select __Product__ > __Scheme__ > __Edit scheme__.
///      - Select __Run__ from the left menu, then select the __Arguments__ tab.
///      - In the _Arguments Passed on Launch_ section, add ```-FIRDebugEnabled```
///      - Within your logs, search for a log message from Crashlytics that contains the following string, which verifies that your app is sending crashes to Firebase
///        ```
///          Completed report submission
///       ```
/// &nbsp;
/// #### ⛔️ Force a test crash:
/// ```dart
///   TextButton(
///     onPressed: () => throw Exception(),
///     child: const Text("Throw Test Exception"),
///   ),
/// ```
/// #### __For more informations,__ [Consult the official documentation  🔗 ](https://firebase.google.com/docs/crashlytics/test-implementation?authuser=0&platform=flutter)

class FirebaseMethod implements ITrackingEvents {
  final FirebaseCredentials credentials;

  FirebaseMethod({required this.credentials}) {
    _initialize();
  }

  Future<void> _initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform(credentials),
    );
  }

  @override
  ITrackingAnalytics get analytics => TrackingFirebaseAnalytics();

  @override
  ITrackingCrashlytics get crashlytics => TrackingFirebaseCrashlytics();
}
