import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/vora_logo.dart';

class RideInProgressScreen extends StatelessWidget {
  const RideInProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
              child: Row(
                children: [
                  IconButton(padding: EdgeInsets.zero, onPressed: () => Navigator.maybePop(context), icon: const Icon(Icons.arrow_back, color: AppColors.navy)),
                  const Spacer(),
                  const VoraLogo(size: 32),
                  const Spacer(),
                  const Icon(Icons.more_vert, color: AppColors.navy),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(AppRadius.md), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6)]),
                child: Row(
                  children: [
                    Container(width: 10, height: 10, decoration: const BoxDecoration(color: AppColors.green, shape: BoxShape.circle)),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Course en cours', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy)),
                          Text('Votre chauffeur est en route.', style: TextStyle(fontSize: 12, color: AppColors.muted)),
                        ],
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(side: const BorderSide(color: AppColors.border), padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6)),
                      child: const Text('Détails', style: TextStyle(color: AppColors.green, fontSize: 12)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color(0xFF1C2A24),
                child: Stack(
                  children: [
                    const Center(child: Icon(Icons.navigation_outlined, size: 64, color: Color(0xFF3A4A44))),
                    Positioned(
                      top: 20, right: 20,
                      child: Container(
                        padding: const EdgeInsets.all(AppSpacing.sm),
                        decoration: BoxDecoration(color: const Color(0xFF12181A), borderRadius: BorderRadius.circular(AppRadius.sm)),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Arrivée', style: TextStyle(color: Colors.white70, fontSize: 11)),
                            Text('Marché Mokolo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20, left: 20,
                      child: Container(
                        padding: const EdgeInsets.all(AppSpacing.sm),
                        decoration: BoxDecoration(color: const Color(0xFF12181A), borderRadius: BorderRadius.circular(AppRadius.sm)),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Départ', style: TextStyle(color: Colors.white70, fontSize: 11)),
                            Text('Bastos', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(AppSpacing.lg, AppSpacing.md, AppSpacing.lg, AppSpacing.md),
              decoration: const BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg))),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
                    decoration: BoxDecoration(color: AppColors.greenLight, borderRadius: BorderRadius.circular(AppRadius.pill)),
                    child: Row(
                      children: const [
                        Icon(Icons.lock, color: AppColors.greenDark, size: 16),
                        SizedBox(width: 6),
                        Expanded(child: Text('Fonds Séquestrés : 700 XAF (Verrouillés)', style: TextStyle(color: AppColors.greenDark, fontWeight: FontWeight.bold, fontSize: 12.5))),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(border: Border.all(color: AppColors.border), borderRadius: BorderRadius.circular(AppRadius.md)),
                    child: Row(
                      children: [
                        const CircleAvatar(radius: 26, backgroundColor: AppColors.greenLight, child: Icon(Icons.person, color: AppColors.green)),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Jean Bataka', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy)),
                              Text('Chauffeur partenaire VORA', style: TextStyle(fontSize: 11, color: AppColors.muted)),
                            ],
                          ),
                        ),
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.phone, size: 14, color: AppColors.green),
                          label: const Text('Appeler', style: TextStyle(color: AppColors.green, fontSize: 11)),
                          style: OutlinedButton.styleFrom(side: const BorderSide(color: AppColors.green)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
