import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        throw UnsupportedError('DefaultFirebaseOptions not configured for ${defaultTargetPlatform.name}');
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCwJHqsDQHviaDZ3kqtTEJDJ9y2drkL0nY',
    appId: '1:24992281168:web:0e431a76ddaf3e2fac1755',
    messagingSenderId: '24992281168',
    projectId: 'andreani-group-app',
    storageBucket: 'andreani-group-app.firebasestorage.app',
    authDomain: 'andreani-group-app.firebaseapp.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCG9lpnwwJ4V7I_MheYdQdtOEGPPN1duUY',
    appId: '1:24992281168:android:dc769f9cf1454f60ac1755',
    messagingSenderId: '24992281168',
    projectId: 'andreani-group-app',
    storageBucket: 'andreani-group-app.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBUXrg3NJjgruoZ8YgxuCyl0limJ3Fmy_M',
    appId: '1:24992281168:ios:b9460ef0bc69e785ac1755',
    messagingSenderId: '24992281168',
    projectId: 'andreani-group-app',
    storageBucket: 'andreani-group-app.firebasestorage.app',
    iosBundleId: 'com.andreanigroup.andreaniApp',
  );
}
