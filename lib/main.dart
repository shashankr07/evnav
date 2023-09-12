import 'package:evnav/evCarRegistration.dart';
import 'package:evnav/evcar.dart';
import 'package:evnav/home.dart';

import 'package:evnav/providerRegistration.dart';
import 'package:evnav/registration.dart';
import 'package:evnav/setUpInteractedMessage.dart';
import 'package:evnav/test.dart';
import 'package:evnav/userProfile.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'login.dart';
import 'map.dart';
import 'package:firebase_core/firebase_core.dart';
import 'current_location/currentLocation.dart';

//import 'evcar_registration.dart';
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();

//   print("Handling a background message: ${message.messageId}");
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await dotenv.load();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    setUpInteractedMessage();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: "Flutter UI",
        debugShowCheckedModeBanner: false,
        home: LoginScreen());
  }
}
