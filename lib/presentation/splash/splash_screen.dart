import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:princess_diaries/presentation/main/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5500),
    )..forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        navToMainScreen();
      }
    });
  }

  void navToMainScreen() {
    Future.delayed(const Duration(milliseconds: 5500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/animation_ljzbt3a9.json',
            controller: _controller,
            onLoaded: (composition) {
              _controller
                ..value = 1
                ..repeat();
            },
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
