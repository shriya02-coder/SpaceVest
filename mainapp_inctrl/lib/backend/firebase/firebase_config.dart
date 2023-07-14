import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAtbr2xre22Ls7y10j5cB4Ju2zsNC0_25s",
            authDomain: "inctrl-889e2.firebaseapp.com",
            projectId: "inctrl-889e2",
            storageBucket: "inctrl-889e2.appspot.com",
            messagingSenderId: "102615698439",
            appId: "1:102615698439:web:1a9b06d9ecee7602cceea2",
            measurementId: "G-K65KVC8T8L"));
  } else {
    await Firebase.initializeApp();
  }
}
