import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDD_xmga216twmya8hQhRf5nXOGZPr9SmA",
            authDomain: "green-way-qjuzj9.firebaseapp.com",
            projectId: "green-way-qjuzj9",
            storageBucket: "green-way-qjuzj9.appspot.com",
            messagingSenderId: "648472636165",
            appId: "1:648472636165:web:d2a9b9754940de977d256c"));
  } else {
    await Firebase.initializeApp();
  }
}
