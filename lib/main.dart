import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home_dashboard_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDL-8AylxHSKGhv6Dnrkbxg8-Gnx2M0CR0",
      appId: "1:111984490782:android:2d9abca5714118ec2a710f",
      messagingSenderId: "111984490782",
      projectId: "padharo-app",
    ),
  );

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
