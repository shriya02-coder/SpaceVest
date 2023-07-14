import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyADns2mdZY60VzIP05NEsMg1Zi6rL8Nc_s",
            authDomain: "chatapp-bd8c5.firebaseapp.com",
            projectId: "chatapp-bd8c5",
            storageBucket: "chatapp-bd8c5.appspot.com",
            messagingSenderId: "183945602171",
            appId: "1:183945602171:web:1307717ce38aab6af86ede",
            measurementId: "G-QEDP8W3C3T"));
  } else {
    await Firebase.initializeApp();
  }
}
