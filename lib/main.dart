import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart';
import 'core/constants.dart';

void main() {
  runApp(const VoraApp());
}

class VoraApp extends StatelessWidget {
  const VoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VORA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bg,
        fontFamily: 'Roboto',
      ),
      home: const OnboardingScreen(),
    );
  }
}
