import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/vora_logo.dart';

class DriverPendingVerificationScreen extends StatelessWidget {
  const DriverPendingVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Column(
            children: [
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  IconButton(padding: EdgeInsets.zero, onPressed: () => Navigator.maybePop(context), icon: const Icon(Icons.arrow_back, color: AppColors.navy)),
                  const Spacer(),
                  const VoraLogo(size: 30),
                  const Spacer(),
                  const SizedBox(width: 40),
                ],
              ),
              const SizedBox(height: AppSpacing.xl),
              SizedBox(
                width: 160, height: 160,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(width: 160, height: 160, decoration: const BoxDecoration(color: AppColors.greenLight, shape: BoxShape.circle)),
                    const Icon(Icons.shield, color: AppColors.green, size: 90),
                    Positioned(
                      right: 30, bottom: 40,
                      child: Container(padding: const EdgeInsets.all(6), decoration: const BoxDecoration(color: AppColors.green, shape: BoxShape.circle), child: const Icon(Icons.check, color: Colors.white, size: 20)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              const Text('Dossier en cours de\nvérification', textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.navy)),
              const SizedBox(height: AppSpacing.sm),
              const Text(
                "Nos équipes vérifient vos pièces d'identité et permis sous 24h. Vous recevrez une notification dès l'activation de votre compte.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: AppColors.muted, height: 1.5),
              ),
              const SizedBox(height: AppSpacing.lg),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(color: const Color(0xFFFFF1D6), borderRadius: BorderRadius.circular(AppRadius.pill)),
                child: const Text('⏳ PENDING / EN ATTENTE', style: TextStyle(color: Color(0xFF8A6200), fontWeight: FontWeight.bold, fontSize: 12)),
              ),
              const SizedBox(height: AppSpacing.lg),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.headset_mic_outlined, color: AppColors.green, size: 18),
                  label: const Text('Contacter le support VORA', style: TextStyle(color: AppColors.green, fontWeight: FontWeight.bold)),
                  style: OutlinedButton.styleFrom(side: const BorderSide(color: AppColors.green), padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.pill))),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
            ],
          ),
        ),
      ),
    );
  }
}
