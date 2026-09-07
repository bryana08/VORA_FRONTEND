import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/vora_logo.dart';

class WeatherAlertScreen extends StatelessWidget {
  const WeatherAlertScreen({super.key});

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
                            decoration: BoxDecoration(
                              color: AppColors.greenLight,
                              borderRadius: BorderRadius.circular(AppRadius.pill),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.location_on, color: AppColors.greenDark, size: 14),
                                SizedBox(width: 4),
                                Text('Yaoundé', style: TextStyle(color: AppColors.greenDark, fontSize: 12, fontWeight: FontWeight.bold)),
                                Icon(Icons.expand_more, size: 14, color: AppColors.greenDark),
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

                    // Bandeau alerte inondation
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(AppSpacing.md),
                        decoration: BoxDecoration(color: const Color(0xFFFFF1D6), borderRadius: BorderRadius.circular(AppRadius.lg)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 40, height: 40,
                              decoration: const BoxDecoration(color: Color(0xFFFFE2A8), shape: BoxShape.circle),
                              child: const Icon(Icons.water_drop, color: Color(0xFFB25E00), size: 20),
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('ALERTE INONDATION & PLUIE BATTANTE',
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFFB25E00))),
                                  SizedBox(height: 4),
                                  Text(
                                    "Voirie difficile détectée sur votre itinéraire. Majoration incitative (+20%) appliquée pour motiver les chauffeurs à prendre votre course.",
                                    style: TextStyle(fontSize: 11.5, color: Color(0xFF8A6200), height: 1.4),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right, color: Color(0xFFB25E00)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),

                    // Chip pluie forte
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.circular(AppRadius.md),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 6)],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.water_drop_outlined, color: Colors.blue, size: 18),
                            SizedBox(width: 8),
                            Text('Pluie forte', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.navy)),
                            SizedBox(width: 6),
                            Text('Circulation perturbée', style: TextStyle(fontSize: 11, color: AppColors.muted)),
                            SizedBox(width: 6),
                            Icon(Icons.chevron_right, color: AppColors.muted, size: 16),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),

                    // Carte (placeholder avec zones à risque)
                    Container(
                      height: 260,
                      width: double.infinity,
                      color: const Color(0xFFEDEEEA),
                      child: Stack(
                        children: [
                          const Center(child: Icon(Icons.map_outlined, size: 56, color: Color(0xFFC7CCC8))),
                          Positioned(top: 16, right: 16, child: _WarningDot()),
                          Positioned(bottom: 40, left: 40, child: _WarningDot()),
                          Positioned(
                            bottom: 16, right: 16,
                            child: Container(
                              width: 38, height: 38,
                              decoration: BoxDecoration(color: AppColors.card, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 4)]),
                              child: const Icon(Icons.my_location, color: AppColors.navy, size: 18),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Panneau bas : trajet + tarif
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
                            children: const [
                              Icon(Icons.location_on, color: AppColors.green, size: 18),
                              SizedBox(width: 6),
                              Text('Marché Mokolo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.navy)),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward, color: AppColors.muted, size: 16),
                              SizedBox(width: 8),
                              Icon(Icons.location_on, color: AppColors.danger, size: 18),
                              SizedBox(width: 6),
                              Text('Carrefour EMIA', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.navy)),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Row(
                            children: const [
                              Icon(Icons.directions_car_outlined, size: 18, color: AppColors.muted),
                              SizedBox(width: 6),
                              Text('VORA Standard', style: TextStyle(fontSize: 13, color: AppColors.navy)),
                              SizedBox(width: 16),
                              Icon(Icons.person_outline, size: 16, color: AppColors.muted),
                              Text(' 4', style: TextStyle(fontSize: 13, color: AppColors.navy)),
                              SizedBox(width: 16),
                              Icon(Icons.access_time, size: 16, color: AppColors.muted),
                              Text(' 12 min', style: TextStyle(fontSize: 13, color: AppColors.navy)),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.md),

                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(AppSpacing.md),
                            decoration: BoxDecoration(color: const Color(0xFFFFF1D6), borderRadius: BorderRadius.circular(AppRadius.md)),
                            child: Row(
                              children: [
                                Container(
                                  width: 36, height: 36,
                                  decoration: const BoxDecoration(color: Color(0xFFFFE2A8), shape: BoxShape.circle),
                                  child: const Icon(Icons.paid_outlined, color: Color(0xFFB25E00), size: 18),
                                ),
                                const SizedBox(width: AppSpacing.sm),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        Text('1 000 XAF', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF8A6200))),
                                        SizedBox(width: 8),
                                        Text('800 XAF', style: TextStyle(fontSize: 13, color: AppColors.muted, decoration: TextDecoration.lineThrough)),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 4),
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                      decoration: BoxDecoration(color: const Color(0xFFFFE2A8), borderRadius: BorderRadius.circular(AppRadius.pill)),
                                      child: const Text('Tarif incitatif mauvais temps', style: TextStyle(fontSize: 10, color: Color(0xFF8A6200), fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppSpacing.md),

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // TODO: appeler ride_service.dart -> POST /rides (avec le tarif incitatif)
                              },
                              icon: const Icon(Icons.shield, color: Colors.white, size: 18),
                              label: const Text('Commander avec Séquestre MoMo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.green,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.pill)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            BottomNavigationBar(
              currentIndex: 0,
              selectedItemColor: AppColors.green,
              unselectedItemColor: AppColors.muted,
              type: BottomNavigationBarType.fixed,
              onTap: (_) {},
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

class _WarningDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26, height: 26,
      decoration: const BoxDecoration(color: Color(0xFFFFE2A8), shape: BoxShape.circle),
      child: const Icon(Icons.warning_amber_rounded, color: Color(0xFFB25E00), size: 16),
    );
  }
}
