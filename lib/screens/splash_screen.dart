import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:tap2024/screens/login_Screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/raikou.png'),
      logoWidth: 100,
      title: Text('Bienvenidos a mi App',
        style: TextStyle(fontFamily: 'poke'),
        ),
      showLoader: true,
      loadingText: Text('Cargando App...',
      style: TextStyle(fontFamily: 'poke')
      ),
      navigator: LoginScreen(),
      durationInSeconds: 3,
      gradientBackground: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomLeft,
        colors: [
          Color.fromARGB(255, 217, 175, 3),
          Colors.amberAccent,
          Colors.yellow,
          Colors.amberAccent,
          Color.fromARGB(255, 217, 175, 3)        ]),
    );
  }
}