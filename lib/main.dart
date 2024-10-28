import 'package:app_brm_01/modules/auth/register.dart';
import 'package:app_brm_01/navigation/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:app_brm_01/modules/auth/Login.dart';
import 'package:app_brm_01/modules/home/home.dart';
import 'package:app_brm_01/navigation/change_password.dart';
import 'package:app_brm_01/navigation/recover_password.dart';
import 'package:app_brm_01/navigation/validation_code.dart';
import 'package:app_brm_01/widgets/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/register': (context) => const Register(),
        '/login': (context) => const Login(),
        '/recover': (context) => const RecoverPassword(),
        '/validation': (context) => const ValidationCode(),
        '/change': (context) => const ChangePassword(),
      },
    );
  }
}
