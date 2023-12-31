// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBBiM3sOaHaJgFcOSWJqS3yL6LPvTf_pbo',
    appId: '1:503243711019:web:17edbc792232187c45806e',
    messagingSenderId: '503243711019',
    projectId: 'tiktok-tiktaktok',
    authDomain: 'tiktok-tiktaktok.firebaseapp.com',
    storageBucket: 'tiktok-tiktaktok.appspot.com',
    measurementId: 'G-BEEP3K67P7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvAZW2roSzvenWvpzL4firhBgfnIM10Ig',
    appId: '1:503243711019:android:c7475bf46559287545806e',
    messagingSenderId: '503243711019',
    projectId: 'tiktok-tiktaktok',
    storageBucket: 'tiktok-tiktaktok.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA3-B4fnwmiRHmtk46eYwU6Sk8YWjUMpvU',
    appId: '1:503243711019:ios:72228e7764ccbdf145806e',
    messagingSenderId: '503243711019',
    projectId: 'tiktok-tiktaktok',
    storageBucket: 'tiktok-tiktaktok.appspot.com',
    iosBundleId: 'com.example.tiktok',
  );
}
