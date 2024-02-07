import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phnotp1/phone_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyDthKCtacs8icOigzj1DxevjbfVS-FDxXQ",
        appId: "1:770163041597:android:b6373697ceff3e3a8dd154",
        messagingSenderId: "770163041597",
        projectId: "authphone-83e0b")
  );


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Phone_Auth(),
    );
  }
}
