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
        return macos;
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
    apiKey: 'AIzaSyCDFivncg9E7JpmsR_Cj2gbcERgt-vlhhA',
    appId: '1:371757693770:web:71206a8b0284b77c02dfb3',
    messagingSenderId: '371757693770',
    projectId: 'flutter-infinite-scroll-chat',
    authDomain: 'flutter-infinite-scroll-chat.firebaseapp.com',
    storageBucket: 'flutter-infinite-scroll-chat.appspot.com',
    measurementId: 'G-WP4SHYPZHJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBu6LXs0pMRhi6HNWugdTe_Og7Nois5WC4',
    appId: '1:371757693770:android:4f9a7f91ad02868202dfb3',
    messagingSenderId: '371757693770',
    projectId: 'flutter-infinite-scroll-chat',
    storageBucket: 'flutter-infinite-scroll-chat.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAIGY9uTPS8NFCt_mLky7bMS0bl9X-z-j4',
    appId: '1:371757693770:ios:1d2a216531069eb802dfb3',
    messagingSenderId: '371757693770',
    projectId: 'flutter-infinite-scroll-chat',
    storageBucket: 'flutter-infinite-scroll-chat.appspot.com',
    iosClientId: '371757693770-nqlfbkmv698btgffkqvm4nc4050bt73m.apps.googleusercontent.com',
    iosBundleId: 'com.example.infiniteScrollChat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAIGY9uTPS8NFCt_mLky7bMS0bl9X-z-j4',
    appId: '1:371757693770:ios:1d2a216531069eb802dfb3',
    messagingSenderId: '371757693770',
    projectId: 'flutter-infinite-scroll-chat',
    storageBucket: 'flutter-infinite-scroll-chat.appspot.com',
    iosClientId: '371757693770-nqlfbkmv698btgffkqvm4nc4050bt73m.apps.googleusercontent.com',
    iosBundleId: 'com.example.infiniteScrollChat',
  );
}
