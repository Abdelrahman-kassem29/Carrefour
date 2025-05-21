import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    // Use platform-specific FirebaseOptions if needed
    return firebaseOptions;
  }

  static const FirebaseOptions firebaseOptions = FirebaseOptions(
    apiKey: '<YOUR_API_KEY>',
    appId: '<YOUR_APP_ID>',
    messagingSenderId: '660026773933',
    projectId: 'carrefourdb',
    storageBucket: '<YOUR_STORAGE_BUCKET>',
    authDomain: '<YOUR_AUTH_DOMAIN>',
    measurementId: '<YOUR_MEASUREMENT_ID>',
  );
}
