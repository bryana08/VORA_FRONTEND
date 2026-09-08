import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/vora_logo.dart';

class CarpoolTrackingScreen extends StatelessWidget {
  const CarpoolTrackingScreen({super.key});

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
                  const VoraLogo(size: 34),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(color: AppColors.greenLight, borderRadius: BorderRadius.circular(AppRadius.pill)),
                    child: Row(mainAxisSize: MainAxisSize.min, children: const [
                      Icon(Icons.groups, color: AppColors.greenDark, size: 14),
                      SizedBox(width: 4),
                      Text('Covoiturage Taxi Jaune', style: TextStyle(color: AppColors.greenDark, fontSize: 11, fontWeight: FontWeight.bold)),
                    ]),
                  ),
                  const SizedBox(width: 8),
                  const CircleAvatar(radius: 16, backgroundColor: AppColors.greenLight, child: Icon(Icons.person, color: AppColors.green, size: 16)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: AppSpacing.md),
                decoration: BoxDecoration(color: AppColors.green, borderRadius: BorderRadius.circular(AppRadius.pill)),
                child: Row(children: const [
                  Icon(Icons.local_taxi, color: Colors.white, size: 16),
                  SizedBox(width: 6),
                  Expanded(child: Text('COVOITURAGE ACTIF - 3 Passagers à bord', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))),
                  Icon(Icons.groups, color: Colors.white, size: 18),
                ]),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Container(
              height: 200, width: double.infinity, color: const Color(0xFFEDEEEA),
              child: const Center(child: Icon(Icons.alt_route_outlined, size: 56, color: Color(0xFFC7CCC8))),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.md),
                      decoration: const BoxDecoration(color: AppColors.dark, borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg))),
                      child: Row(children: const [
                        Icon(Icons.alt_route, color: Colors.white, size: 20),
                        SizedBox(width: 8),
                        Expanded(child: Text('Feuille de route', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16))),
                      ]),
                    ),
                    Container(
                      width: double.infinity,
                      color: AppColors.bg,
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _StopTile(number: '1', title: 'Dépose de Marie', subtitle: '(Carrefour EMIA)', meta: 'Prochain arrêt (dans 400m) :', badge: 'Actuel', badgeColor: AppColors.green, active: true),
                          const SizedBox(height: AppSpacing.sm),
                          _StopTile(number: '2', title: 'Marché Mokolo', subtitle: '(Arrivée estimée dans 8 min)', meta: 'Votre destination :', badge: 'Suivant', badgeColor: AppColors.muted, active: false),
                          const SizedBox(height: AppSpacing.md),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(AppSpacing.md),
                            decoration: BoxDecoration(color: AppColors.greenLight, borderRadius: BorderRadius.circular(AppRadius.md)),
                            child: Row(children: [
                              const Icon(Icons.lock, color: AppColors.greenDark, size: 18),
                              const SizedBox(width: 8),
                              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                                Text('Votre Séquestre individuel :', style: TextStyle(fontSize: 11, color: AppColors.greenDark)),
                                Text('500 XAF (Verrouillé)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.greenDark)),
                              ])),
                            ]),
                          ),
                          const SizedBox(height: AppSpacing.md),
                          const Text('Chauffeur & Véhicule', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy)),
                          const SizedBox(height: AppSpacing.sm),
                          Container(
                            padding: const EdgeInsets.all(AppSpacing.md),
                            decoration: BoxDecoration(color: AppColors.card, borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: AppColors.border)),
                            child: Row(children: [
                              const CircleAvatar(radius: 24, backgroundColor: AppColors.greenLight, child: Icon(Icons.person, color: AppColors.green)),
                              const SizedBox(width: AppSpacing.sm),
                              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                                Text('Paul K.', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.navy)),
                                Text('4.9 (142 courses)', style: TextStyle(fontSize: 11, color: AppColors.muted)),
                              ])),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                                decoration: BoxDecoration(color: AppColors.greenLight, borderRadius: BorderRadius.circular(AppRadius.sm)),
                                child: const Column(children: [
                                  Text('YDE-1420', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.navy)),
                                  Text('LT 892 AB', style: TextStyle(fontSize: 9, color: AppColors.muted)),
                                ]),
                              ),
                            ]),
                          ),
                          const SizedBox(height: AppSpacing.md),
                          Row(children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.warning_amber_rounded, color: Colors.white, size: 18),
                                label: const Text('SOS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                style: ElevatedButton.styleFrom(backgroundColor: AppColors.danger, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.pill))),
                              ),
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Expanded(
                              flex: 2,
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.phone, color: Colors.white, size: 18),
                                label: const Text('Contacter Chauffeur', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                                style: ElevatedButton.styleFrom(backgroundColor: AppColors.green, padding: const EdgeInsets.symmetric(vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.pill))),
                              ),
                            ),
                          ]),
                        ],
                      ),
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

class _StopTile extends StatelessWidget {
  final String number;
  final String title;
  final String subtitle;
  final String meta;
  final String badge;
  final Color badgeColor;
  final bool active;
  const _StopTile({required this.number, required this.title, required this.subtitle, required this.meta, required this.badge, required this.badgeColor, required this.active});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(color: active ? AppColors.greenLight : AppColors.card, borderRadius: BorderRadius.circular(AppRadius.md), border: Border.all(color: active ? AppColors.green.withOpacity(0.3) : AppColors.border)),
      child: Row(children: [
        Container(width: 30, height: 30, decoration: BoxDecoration(color: active ? AppColors.green : const Color(0xFFDDE1DE), shape: BoxShape.circle), child: Center(child: Text(number, style: TextStyle(color: active ? Colors.white : AppColors.navy, fontWeight: FontWeight.bold)))),
        const SizedBox(width: AppSpacing.sm),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(meta, style: const TextStyle(fontSize: 10, color: AppColors.muted)),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.navy)),
          Text(subtitle, style: const TextStyle(fontSize: 10, color: AppColors.muted)),
        ])),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(color: badgeColor, borderRadius: BorderRadius.circular(AppRadius.pill)),
          child: Text(badge, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
        ),
      ]),
    );
  }
}
