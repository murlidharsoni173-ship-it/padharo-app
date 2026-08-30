import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home_dashboard_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: const FirebaseInitWrapper(),
    );
  }
}

class FirebaseInitWrapper extends StatefulWidget {
  const FirebaseInitWrapper({Key? key}) : super(key: key);

  @override
  State<FirebaseInitWrapper> createState() => _FirebaseInitWrapperState();
}

class _FirebaseInitWrapperState extends State<FirebaseInitWrapper> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  'Firebase Error:\n${snapshot.error}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return const HomeDashboardScreen();
        }

        return const Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: CircularProgressIndicator(color: Color(0xFF1B4D3E)),
          ),
        );
      },
    );
  }
}
