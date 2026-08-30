import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home_dashboard_screen.dart';

void main() async {
  // Flutter bindings ko screen render hone se pehle initialize karta hai
  WidgetsFlutterBinding.ensureInitialized();
  
  // Firebase initialization handle karne ke liye try-catch block
  try {
    await Firebase.initializeApp();
  } catch (e) {
    debugPrint("Firebase Initialization Error: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Padharo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF1B4D3E),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1B4D3E)),
        useMaterial3: true,
      ),
      home: const HomeDashboardScreen(),
    );
  }
}
