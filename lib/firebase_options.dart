// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyChkVbYNtl6_0c5uJyuhoGqCP9BnT4FcPY',
    appId: '1:997806413761:web:306eafa5d7dd73f9b54140',
    messagingSenderId: '997806413761',
    projectId: 'furni-app-fde52',
    authDomain: 'furni-app-fde52.firebaseapp.com',
    databaseURL: 'https://furni-app-fde52-default-rtdb.firebaseio.com',
    storageBucket: 'furni-app-fde52.appspot.com',
    measurementId: 'G-FJBQ9KG9GB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxqWfg6h91PiFajtZI78iJxhJwvMo17yA',
    appId: '1:997806413761:android:c39fc9e21573addab54140',
    messagingSenderId: '997806413761',
    projectId: 'furni-app-fde52',
    databaseURL: 'https://furni-app-fde52-default-rtdb.firebaseio.com',
    storageBucket: 'furni-app-fde52.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDLCGDNyIK5FeuPDFD3Rp2xELZlNIVX4Zg',
    appId: '1:997806413761:ios:abe9b4952c5a0839b54140',
    messagingSenderId: '997806413761',
    projectId: 'furni-app-fde52',
    databaseURL: 'https://furni-app-fde52-default-rtdb.firebaseio.com',
    storageBucket: 'furni-app-fde52.appspot.com',
    iosClientId: '997806413761-116tkv48fs7sqauqoi9mn96tpgjqrf0t.apps.googleusercontent.com',
    iosBundleId: 'com.example.myapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyChkVbYNtl6_0c5uJyuhoGqCP9BnT4FcPY',
    appId: '1:997806413761:web:636e8efe2b6978c0b54140',
    messagingSenderId: '997806413761',
    projectId: 'furni-app-fde52',
    authDomain: 'furni-app-fde52.firebaseapp.com',
    databaseURL: 'https://furni-app-fde52-default-rtdb.firebaseio.com',
    storageBucket: 'furni-app-fde52.appspot.com',
    measurementId: 'G-VTRP891HVX',
  );

}