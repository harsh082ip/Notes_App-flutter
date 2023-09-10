import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/views/screen/auth/forget_screen.dart';
import 'package:notes_app/views/screen/auth/login.dart';
import 'package:notes_app/views/screen/auth/verify_email_address.dart';

import 'controller/firebase_auth.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _initializeFireBase();
  runApp(const MyApp());
}

_initializeFireBase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    Get.put(Auth());
    print('firebase initialized');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          useMaterial3: false,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
          )),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
