/// These credentials can be found in your project's Firebase dashboard or through the files _google-services.json_ (Android project) and _GoogleService-info.plist_ (iOS project)
final class FirebaseCredentials {
  final String apiKey;
  final String appId;
  final String messagingSenderId;
  final String projectId;
  final String? storageBucket;
  final String? iosBundleId;

  const FirebaseCredentials({
    required this.apiKey,
    required this.appId,
    required this.messagingSenderId,
    required this.projectId,
    required this.storageBucket,
    required this.iosBundleId,
  });
}
