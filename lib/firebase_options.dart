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
    apiKey: 'AIzaSyBw9ks1uSI7NNxw74R5rSJ_F-D1Wejl-Rg',
    appId: '1:123609874806:web:4d1bdd0edbd6dd4d027a57',
    messagingSenderId: '123609874806',
    projectId: 'sungel-app-78b97',
    authDomain: 'sungel-app-78b97.firebaseapp.com',
    storageBucket: 'sungel-app-78b97.appspot.com',
    measurementId: 'G-9Q9WFFVT4Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCEP7l3nvHPmYH_v2UKlgSVVz1lrNUhGAM',
    appId: '1:123609874806:android:db41b3fc62359831027a57',
    messagingSenderId: '123609874806',
    projectId: 'sungel-app-78b97',
    storageBucket: 'sungel-app-78b97.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBfJcZpi6JOsJZ9OmB8MMtThA--5X7T5-I',
    appId: '1:123609874806:ios:0808d0a39d0430a5027a57',
    messagingSenderId: '123609874806',
    projectId: 'sungel-app-78b97',
    storageBucket: 'sungel-app-78b97.appspot.com',
    iosClientId: '123609874806-l7nmsb609siqh2dqe09nal6pq17ht5oi.apps.googleusercontent.com',
    iosBundleId: 'com.example.sungelApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBfJcZpi6JOsJZ9OmB8MMtThA--5X7T5-I',
    appId: '1:123609874806:ios:0808d0a39d0430a5027a57',
    messagingSenderId: '123609874806',
    projectId: 'sungel-app-78b97',
    storageBucket: 'sungel-app-78b97.appspot.com',
    iosClientId: '123609874806-l7nmsb609siqh2dqe09nal6pq17ht5oi.apps.googleusercontent.com',
    iosBundleId: 'com.example.sungelApp',
  );
}