import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/vora_logo.dart';

class DriverApproachingScreen extends StatelessWidget {
  const DriverApproachingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
              child: Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => Navigator.maybePop(context),
                    icon: const Icon(Icons.arrow_back, color: AppColors.navy),
                  ),
                  const Spacer(),
                  const VoraLogo(size: 30),
                  const Spacer(),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(Icons.notifications_none, color: AppColors.navy),
                      Positioned(
                        right: -2, top: -2,
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(color: AppColors.danger, shape: BoxShape.circle),
                          child: const Text('2', style: TextStyle(color: Colors.white, fontSize: 9)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Bandeau "Course en cours"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(color: AppColors.greenLight, borderRadius: BorderRadius.circular(AppRadius.pill)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.circle, color: AppColors.green, size: 8),
                      SizedBox(width: 6),
                      Text('Course en cours', style: TextStyle(color: AppColors.greenDark, fontSize: 12, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),

            // Carte (placeholder)
            Expanded(
              child: Container(
                width: double.infinity,
                color: const Color(0xFFEDEEEA),
                child: Stack(
                  children: [
                    const Center(child: Icon(Icons.local_taxi, size: 56, color: Color(0xFFC7CCC8))),
                    Positioned(
                      top: 16, left: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.circular(AppRadius.md),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 6)],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 32, height: 32,
                              decoration: const BoxDecoration(color: AppColors.greenLight, shape: BoxShape.circle),
                              child: const Icon(Icons.directions_car, color: AppColors.green, size: 18),
                            ),
                            const SizedBox(width: 8),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Votre chauffeur arrive dans', style: TextStyle(fontSize: 11, color: AppColors.muted)),
                                Text('3 min', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.greenDark)),
                              ],
                            ),
                            const SizedBox(width: 6),
                            const Icon(Icons.chevron_right, color: AppColors.muted, size: 18),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20, left: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.circular(AppRadius.sm),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 4)],
                        ),
                        child: const Text('Votre position', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.navy)),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Panneau bas : infos chauffeur
            Container(
              padding: const EdgeInsets.fromLTRB(AppSpacing.lg, AppSpacing.md, AppSpacing.lg, AppSpacing.md),
              decoration: const BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Container(width: 40, height: 4, decoration: BoxDecoration(color: AppColors.border, borderRadius: BorderRadius.circular(2)))),
                    const SizedBox(height: AppSpacing.md),

                    Row(
                      children: [
                        const CircleAvatar(radius: 32, backgroundColor: AppColors.greenLight, child: Icon(Icons.person, color: AppColors.green, size: 32)),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(color: AppColors.greenLight, borderRadius: BorderRadius.circular(AppRadius.pill)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(Icons.shield, color: AppColors.green, size: 12),
                                    SizedBox(width: 4),
                                    Text('Chauffeur Vérifié VORA', style: TextStyle(color: AppColors.greenDark, fontSize: 10, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text('Jean-Paul M.', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.navy)),
                              Row(
                                children: const [
                                  Icon(Icons.star, color: Colors.amber, size: 16),
                                  SizedBox(width: 4),
                                  Text('4.9', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy)),
                                  SizedBox(width: 4),
                                  Text('(142 courses)', style: TextStyle(color: AppColors.muted, fontSize: 12)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: AppSpacing.md), child: Divider(height: 1)),

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Toyota Yaris', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy)),
                              Text('(Taxi Jaune)', style: TextStyle(fontSize: 11, color: AppColors.muted)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Expérience', style: TextStyle(fontSize: 11, color: AppColors.muted)),
                              Text('5 ans', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Assurance', style: TextStyle(fontSize: 11, color: AppColors.muted)),
                              Text('Oui', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.green)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.md),

                    // Bandeau jaune : n° portière + plaque
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(color: const Color(0xFFF7D774), borderRadius: BorderRadius.circular(AppRadius.md)),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(color: Color(0xFFF0B429), shape: BoxShape.circle),
                            child: const Icon(Icons.local_taxi, color: Colors.white, size: 18),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('N° PORTIÈRE :', style: TextStyle(fontSize: 10, color: Color(0xFF6B4E00))),
                                Text('YDE-1420', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.navy)),
                              ],
                            ),
                          ),
                          Container(width: 1, height: 32, color: const Color(0xFF6B4E00).withOpacity(0.3)),
                          const SizedBox(width: AppSpacing.sm),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Plaque :', style: TextStyle(fontSize: 10, color: Color(0xFF6B4E00))),
                              Text('LT 892 AB', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.navy)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSpacing.sm),
                      decoration: BoxDecoration(color: AppColors.greenLight, borderRadius: BorderRadius.circular(AppRadius.md)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(Icons.security, color: AppColors.green, size: 18),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Vérifiez impérativement le numéro YDE-1420 sur la portière du taxi avant de monter à bord.',
                              style: TextStyle(fontSize: 11.5, color: AppColors.greenDark, height: 1.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // TODO: contacter le chauffeur (appel ou chat)
                        },
                        icon: const Icon(Icons.phone, color: Colors.white, size: 18),
                        label: const Text('Contacter le chauffeur', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.green,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md)),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        _FooterFeature(icon: Icons.verified_user_outlined, label: 'Paiement sécurisé\nsur l\'application'),
                        _FooterFeature(icon: Icons.location_on_outlined, label: 'Suivi en temps réel\nde votre course'),
                        _FooterFeature(icon: Icons.headset_mic_outlined, label: 'Assistance 24/7\nVORA'),
                        _FooterFeature(icon: Icons.eco_outlined, label: 'Un trajet plus sûr\npour tous'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FooterFeature extends StatelessWidget {
  final IconData icon;
  final String label;
  const _FooterFeature({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Column(
        children: [
          Icon(icon, color: AppColors.green, size: 20),
          const SizedBox(height: 4),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 9, color: AppColors.muted, height: 1.3)),
        ],
      ),
    );
  }
}
