import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/vora_logo.dart';
import 'signup_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Column(
            children: [
              const SizedBox(height: AppSpacing.lg),
              const VoraLogo(size: 70),
              const SizedBox(height: AppSpacing.xl),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF3EE),
                    borderRadius: BorderRadius.circular(AppRadius.lg),
                  ),
                  child: const Center(child: VoraLogo(size: 140)),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.navy),
                  children: [
                    TextSpan(text: 'VORA : ', style: TextStyle(color: AppColors.green)),
                    TextSpan(text: 'Le transport réinventé\nau Cameroun'),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Container(width: 40, height: 3, color: AppColors.green),
              const SizedBox(height: AppSpacing.md),
              const Text(
                "Déplacez-vous en toute sécurité, négociez vos tarifs et payez avec Mobile Money, même sans internet.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: AppColors.muted, height: 1.5),
              ),
              const SizedBox(height: AppSpacing.lg),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const SignupScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Commencer maintenant', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
            ],
          ),
        ),
      ),
    );
  }
}
