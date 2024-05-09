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
        return macos;
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
    apiKey: 'AIzaSyB2Qa8IbYlHO4DLPBfxVuyIUA-RrVYcVBE',
    appId: '1:585574304620:web:b91702b708df377f424149',
    messagingSenderId: '585574304620',
    projectId: 'cd-hotel',
    authDomain: 'cd-hotel.firebaseapp.com',
    storageBucket: 'cd-hotel.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBGQ2qyuQ0XrO3Yhvu77wcpQ2LUj6JxF5I',
    appId: '1:585574304620:android:501ae1da8e6c2d64424149',
    messagingSenderId: '585574304620',
    projectId: 'cd-hotel',
    storageBucket: 'cd-hotel.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBMNzdzKddBgEv99bnESKqhH93ujWmeE5M',
    appId: '1:585574304620:ios:d47bfbd7cc4b7395424149',
    messagingSenderId: '585574304620',
    projectId: 'cd-hotel',
    storageBucket: 'cd-hotel.appspot.com',
    iosBundleId: 'com.example.hotel',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBMNzdzKddBgEv99bnESKqhH93ujWmeE5M',
    appId: '1:585574304620:ios:d47bfbd7cc4b7395424149',
    messagingSenderId: '585574304620',
    projectId: 'cd-hotel',
    storageBucket: 'cd-hotel.appspot.com',
    iosBundleId: 'com.example.hotel',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB2Qa8IbYlHO4DLPBfxVuyIUA-RrVYcVBE',
    appId: '1:585574304620:web:205ad3ac68d496f4424149',
    messagingSenderId: '585574304620',
    projectId: 'cd-hotel',
    authDomain: 'cd-hotel.firebaseapp.com',
    storageBucket: 'cd-hotel.appspot.com',
  );

}