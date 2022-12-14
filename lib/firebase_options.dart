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
    apiKey: 'AIzaSyB2-o4Ve6iWPUNd3FCqFEy4g7tyVuvyj3M',
    appId: '1:597485088916:web:45cd19e30862b5ef334481',
    messagingSenderId: '597485088916',
    projectId: 'sorteador-fd79c',
    authDomain: 'sorteador-fd79c.firebaseapp.com',
    storageBucket: 'sorteador-fd79c.appspot.com',
    measurementId: 'G-3C2JGP69V5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAvHGXsjFbiJDlPO98A9mtJ5fSO6H2yXbg',
    appId: '1:597485088916:android:c3ff33a2801f0656334481',
    messagingSenderId: '597485088916',
    projectId: 'sorteador-fd79c',
    storageBucket: 'sorteador-fd79c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBUnCsBhs_98iOVZkPjM26fcIesl0VNsnE',
    appId: '1:597485088916:ios:f3acefcb24a9843a334481',
    messagingSenderId: '597485088916',
    projectId: 'sorteador-fd79c',
    storageBucket: 'sorteador-fd79c.appspot.com',
    iosClientId: '597485088916-fvvgqn7lcoaiig22kv4uriha5sobo6gr.apps.googleusercontent.com',
    iosBundleId: 'com.example.sorteador',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBUnCsBhs_98iOVZkPjM26fcIesl0VNsnE',
    appId: '1:597485088916:ios:f3acefcb24a9843a334481',
    messagingSenderId: '597485088916',
    projectId: 'sorteador-fd79c',
    storageBucket: 'sorteador-fd79c.appspot.com',
    iosClientId: '597485088916-fvvgqn7lcoaiig22kv4uriha5sobo6gr.apps.googleusercontent.com',
    iosBundleId: 'com.example.sorteador',
  );
}
