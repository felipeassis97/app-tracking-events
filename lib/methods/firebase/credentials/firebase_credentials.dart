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

//Android
  //apiKey: AIzaSyCAlQAUwDfAy25gD17gf3lsmE6ZHFKyaEU
  //appId: 1:851793481185:android:a33c885121939424f196a0
  //projectId: sears-dev-32a1d
  //storageBucket: sears-dev-32a1d.appspot.com
  // messagingSenderId: 851793481185

//IOS
  // apiKey: AIzaSyA_vvrsWMZsk_ftSJeYwhJr4ncX5Crp0ic
  // appId: 1:851793481185:ios:c3cecc07d5686a0bf196a0
  // messagingSenderId: 851793481185
  // iosBundleId: com.evertec.wallet.sears
  // projectId: sears-dev-32a1d
  // storageBucket: sears-dev-32a1d.appspot.com

