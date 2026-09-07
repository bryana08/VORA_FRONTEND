import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/vora_logo.dart';

class SafetyScreen extends StatefulWidget {
  const SafetyScreen({super.key});

  @override
  State<SafetyScreen> createState() => _SafetyScreenState();
}

class _SafetyScreenState extends State<SafetyScreen> {
  int navIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
                      child: Row(
                        children: [
                          const VoraLogo(size: 34),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(color: AppColors.greenLight, borderRadius: BorderRadius.circular(AppRadius.pill)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.shield, color: AppColors.greenDark, size: 14),
                                SizedBox(width: 4),
                                Text('Sécurité activée', style: TextStyle(color: AppColors.greenDark, fontSize: 11, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              const Icon(Icons.notifications_none, color: AppColors.navy),
                              Positioned(
                                right: -2, top: -2,
                                child: Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppColors.danger, shape: BoxShape.circle)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Bandeau SOS
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                      child: InkWell(
                        onTap: () {
                          // TODO: déclencher l'alerte SOS -> POST /sos (avec position GPS)
                        },
                        borderRadius: BorderRadius.circular(AppRadius.lg),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(AppSpacing.md),
                          decoration: BoxDecoration(color: AppColors.danger, borderRadius: BorderRadius.circular(AppRadius.lg)),
                          child: Row(
                            children: [
                              Container(
                                width: 44, height: 44,
                                decoration: const BoxDecoration(color: Colors.white24, shape: BoxShape.circle),
                                child: const Icon(Icons.notifications_active, color: Colors.white, size: 22),
                              ),
                              const SizedBox(width: AppSpacing.sm),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('SOS / ALERTE DANGER', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                                    SizedBox(height: 2),
                                    Text('En cas de problème, appuyez ici pour alerter vos proches et les secours.',
                                        style: TextStyle(color: Colors.white, fontSize: 11.5, height: 1.3)),
                                  ],
                                ),
                              ),
                              const Icon(Icons.chevron_right, color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),

                    // Partager le lien de suivi
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(AppSpacing.md),
                        decoration: BoxDecoration(color: AppColors.greenLight, borderRadius: BorderRadius.circular(AppRadius.lg)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.link, color: AppColors.green, size: 22),
                            const SizedBox(width: AppSpacing.sm),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Partager le lien de suivi en direct',
                                      style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.greenDark, fontSize: 13)),
                                  SizedBox(height: 2),
                                  Text(
                                    "Lien Web public sécurisé - Vos proches peuvent suivre votre trajet en temps réel sans installer l'application.",
                                    style: TextStyle(fontSize: 11, color: AppColors.greenDark, height: 1.4),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              // TODO: appeler share_plus pour partager le lien de suivi public
                            },
                            icon: const Icon(Icons.share, color: Colors.white, size: 16),
                            label: const Text('Partager', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.green,
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.pill)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),

                    // Carte (placeholder)
                    Container(
                      height: 260,
                      width: double.infinity,
                      color: const Color(0xFFEDEEEA),
                      child: Stack(
                        children: [
                          const Center(child: Icon(Icons.gps_fixed, size: 56, color: Color(0xFFC7CCC8))),
                          Positioned(
                            top: 16, right: 16,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(AppRadius.sm)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(Icons.location_on, color: AppColors.green, size: 14),
                                  SizedBox(width: 4),
                                  Text('Carrefour EMIA', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.navy)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Panneau bas : passager à bord
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      decoration: const BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 44, height: 44,
                                decoration: const BoxDecoration(color: AppColors.greenLight, shape: BoxShape.circle),
                                child: const Icon(Icons.directions_car, color: AppColors.green, size: 22),
                              ),
                              const SizedBox(width: AppSpacing.sm),
                              Expanded(
                                child: Row(
                                  children: const [
                                    Expanded(
                                      child: Text('Passager à bord - Sécurité active',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.navy)),
                                    ),
                                    Icon(Icons.check_circle, color: AppColors.green, size: 20),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Row(
                            children: const [
                              Icon(Icons.person_outline, size: 16, color: AppColors.muted),
                              SizedBox(width: 6),
                              Text('Chauffeur : Jean Dupont', style: TextStyle(fontSize: 12.5, color: AppColors.navy)),
                              SizedBox(width: 8),
                              Icon(Icons.star, color: Colors.amber, size: 14),
                              Text(' 4.8', style: TextStyle(fontSize: 12, color: AppColors.navy)),
                              SizedBox(width: 8),
                              Text('|  Toyota Corolla', style: TextStyle(fontSize: 12, color: AppColors.muted)),
                            ],
                          ),
                          const SizedBox(height: 6),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: const [
                                Icon(Icons.location_on_outlined, size: 16, color: AppColors.muted),
                                SizedBox(width: 6),
                                Expanded(child: Text('Destination : Carrefour EMIA', style: TextStyle(fontSize: 12.5, color: AppColors.navy))),
                                Icon(Icons.chevron_right, color: AppColors.muted, size: 18),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 8),
                            decoration: BoxDecoration(color: AppColors.greenLight, borderRadius: BorderRadius.circular(AppRadius.md)),
                            child: Row(
                              children: const [
                                Icon(Icons.shield, color: AppColors.greenDark, size: 16),
                                SizedBox(width: 6),
                                Expanded(child: Text('Votre trajet est surveillé en temps réel', style: TextStyle(fontSize: 12, color: AppColors.greenDark, fontWeight: FontWeight.bold))),
                                Icon(Icons.signal_cellular_alt, color: AppColors.greenDark, size: 16),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom nav
            BottomNavigationBar(
              currentIndex: navIndex,
              onTap: (i) => setState(() => navIndex = i),
              selectedItemColor: AppColors.green,
              unselectedItemColor: AppColors.muted,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Accueil'),
                BottomNavigationBarItem(icon: Icon(Icons.alt_route_outlined), label: 'Trajet'),
                BottomNavigationBarItem(icon: Icon(Icons.shield_outlined), label: 'Sécurité'),
                BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Compte'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
