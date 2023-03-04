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
    apiKey: 'AIzaSyCJKueK_12FQ4GoNI-riXZztWV8VaAKbwE',
    appId: '1:98329014352:web:346c87a61e51039c492155',
    messagingSenderId: '98329014352',
    projectId: 'notes-47806',
    authDomain: 'notes-47806.firebaseapp.com',
    databaseURL: 'https://notes-47806-default-rtdb.firebaseio.com',
    storageBucket: 'notes-47806.appspot.com',
    measurementId: 'G-VVWMC0XYGH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAwgmgZiB1JgTTbTJgn7Nt_dFOBE13_DqQ',
    appId: '1:98329014352:android:75fd5e6f6f14ccaf492155',
    messagingSenderId: '98329014352',
    projectId: 'notes-47806',
    databaseURL: 'https://notes-47806-default-rtdb.firebaseio.com',
    storageBucket: 'notes-47806.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCARZ-pHTeSWKVYKKS8Mql9VuymAMXz7k0',
    appId: '1:98329014352:ios:ac07d64b6441a563492155',
    messagingSenderId: '98329014352',
    projectId: 'notes-47806',
    databaseURL: 'https://notes-47806-default-rtdb.firebaseio.com',
    storageBucket: 'notes-47806.appspot.com',
    iosClientId:
        '98329014352-qoj1evsjkirfvdmqa0solumcpujhjt5c.apps.googleusercontent.com',
    iosBundleId: 'com.example.notesapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCARZ-pHTeSWKVYKKS8Mql9VuymAMXz7k0',
    appId: '1:98329014352:ios:ac07d64b6441a563492155',
    messagingSenderId: '98329014352',
    projectId: 'notes-47806',
    databaseURL: 'https://notes-47806-default-rtdb.firebaseio.com',
    storageBucket: 'notes-47806.appspot.com',
    iosClientId:
        '98329014352-qoj1evsjkirfvdmqa0solumcpujhjt5c.apps.googleusercontent.com',
    iosBundleId: 'com.example.notesapp',
  );
}
