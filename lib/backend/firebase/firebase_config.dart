import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCClRdIlkOfmPvotlqhOdJitLSFOWlPIkI",
            authDomain: "watchr-7df69.firebaseapp.com",
            projectId: "watchr-7df69",
            storageBucket: "watchr-7df69.appspot.com",
            messagingSenderId: "398385564600",
            appId: "1:398385564600:web:cfe97db7b43ff143ab5d4d",
            measurementId: "G-KE4J5J98PL"));
  } else {
    await Firebase.initializeApp();
  }
}
