import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_munim/screens/home_screen.dart';
import 'package:online_munim/screens/mobile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MobileScreen(),
      // home: HomeScreen(),
    );
  }
}
