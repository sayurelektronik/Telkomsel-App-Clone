import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:telkomsel_app/screens/bottom_navbar.dart';
import 'package:telkomsel_app/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(selectedItemColor: redColor),
      ),
      title: 'Telkomsel App Clone',
      home: const BottomNavBar(),
    );
  }
}
