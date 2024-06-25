import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:app_tracking_events/methods/firebase/credentials/firebase_credentials.dart';

class DefaultFirebaseOptions {
  const DefaultFirebaseOptions();

  static FirebaseOptions currentPlatform(FirebaseCredentials credentials) {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return _buildAndroidCredentials(credentials);
      case TargetPlatform.iOS:
        return _buildIOSCredentials(credentials);
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static FirebaseOptions _buildAndroidCredentials(
      FirebaseCredentials credentials) {
    return FirebaseOptions(
      apiKey: credentials.apiKey,
      appId: credentials.appId,
      messagingSenderId: credentials.messagingSenderId,
      projectId: credentials.projectId,
      storageBucket: credentials.storageBucket,
    );
  }

  static FirebaseOptions _buildIOSCredentials(FirebaseCredentials credentials) {
    return FirebaseOptions(
      apiKey: credentials.apiKey,
      appId: credentials.appId,
      messagingSenderId: credentials.messagingSenderId,
      iosBundleId: credentials.iosBundleId,
      projectId: credentials.projectId,
      storageBucket: credentials.storageBucket,
    );
  }
}
