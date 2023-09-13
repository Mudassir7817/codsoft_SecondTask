import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Provider/provider.dart';
import 'package:quiz_app/Screens/SplashScreen.dart';

import 'Routes.dart';
import 'Screens/HomePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    log('Firebase initialization error: $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Questions(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => const SplashScreen(),
          MyRoutes.homeroute: (context) => const HomePage(),
        },
      ),
    );
  }
}
