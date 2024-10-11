import 'package:app_brm_01/modules/auth/Login.dart';
import 'package:app_brm_01/modules/home/home.dart';
import 'package:app_brm_01/navigation/change_password.dart';
import 'package:app_brm_01/navigation/recover_password.dart';
import 'package:app_brm_01/navigation/validation_code.dart';
import 'package:app_brm_01/widgets/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     initialRoute: '/',
     routes: {
      '/': (context) => const SplashScreen(),
      '/home': (context) => const Home(),
      '/login': (context) => const Login(),
      '/recover': (context) => const RecoverPassword(),
      '/validation': (context)=> const ValidationCode(),
      '/change': (context) => const ChangePassword(),
     },
    );
  }
}
